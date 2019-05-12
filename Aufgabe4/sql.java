import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.sql.*;

public class sql {


    public static void main(String args[]) throws IOException {

        String name = null;
        String passwd = null;
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        Connection conn = null;
        Statement stmt = null;
        ResultSet rset = null;

        String land = "";
        String andatum = "";
        String abdatum = "";
        String ausstattung = "";
        String fer_name = "";
        String email = "";
        String ID = "";

        String adr_id = "";
        String strasse = "";
        String plz = "";
        String hausnummer = "";
        String stadt = " ";
        String strassenr = "";

        String newsletter = "";
        String passwort = "";
        String kundname = "";
        String iban = "";

        Boolean neuerKunde = true;

        int i = 14;

        System.out.println("Benutzername: ");
        name = "dbsys47";
        System.out.println("Passwort:");
        passwd = "dbsys47";

        try {
            System.out.println("Land:");
            land = in.readLine();

            System.out.println("Anreisedatum");
            andatum = in.readLine();

            System.out.println("Abreisedatum");
            abdatum = in.readLine();

            System.out.println("Ausstattung (Optional)");
            ausstattung = in.readLine();

        } catch (IOException e) {
            System.out.println("Fehler");
            System.exit(-1);
        }
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());                // Treiber laden
            String url = "jdbc:oracle:thin:@oracle12c.in.htwg-konstanz.de:1521:ora12c"; // String f�r DB-Connection
            conn = DriverManager.getConnection(url, name, passwd);                        // Verbindung erstellen

            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);            // Transaction Isolations-Level setzen
            conn.setAutoCommit(false);                                                    // Kein automatisches Commit

            stmt = conn.createStatement();                                                // Statement-Objekt erzeugen

            /*String myUpdateQuery = "INSERT INTO pers(pnr, name, jahrg, eindat, gehalt, anr) " +
                    "VALUES('124', 'Huber', 1980, sysdate, 80000, 'K51')";				// Mitarbeiter hinzuf�gen
            stmt.executeUpdate(myUpdateQuery);*/
            String mySelectQuery = "SELECT fer_name as Ferienwohnung, AVG(b.buch_sterne) AS Sterne " +
                    "FROM dbsys46.Ferienwohnung f, ferfertig ff LEFT OUTER JOIN dbsys46.Buchung b ON b.fer_ID = ff.ferienwohnung " +
                    "WHERE f.fer_ID = ff.ferienwohnung " +
                    "GROUP BY fer_name " +
                    "ORDER BY AVG(b.buch_sterne) DESC";

            String mySelectQuery2 = "CREATE OR REPLACE VIEW ferdatum AS " +
                    "SELECT f.fer_ID " +
                    "FROM dbsys46.Buchung b INNER JOIN dbsys46.Ferienwohnung f ON f.fer_ID = b.fer_ID " +
                    "WHERE((b.buch_startdatum <= '" + andatum + "' AND b.buch_startdatum >= '" + andatum + "') OR (b.buch_enddatum <= '" + abdatum + "' AND b.buch_enddatum >= '" + andatum + "') OR (b.buch_startdatum <= '" + andatum + "' AND b.buch_enddatum >= '" + abdatum + "'))";

            String mySelectQuery3 = "CREATE OR REPLACE  VIEW ferbuchung AS " +
                    "SELECT f.fer_ID as Ferienwohnung " +
                    "FROM dbsys46.Buchung b, dbsys46.beinhaltet i INNER JOIN dbsys46.Ferienwohnung f ON i.fer_ID = f.fer_ID " +
                    "WHERE aust_ID = '" + ausstattung + "' AND f.land_name = '" + land + "'";

            String mySelectQuery31 = "CREATE OR REPLACE  VIEW ferbuchung AS " +
                    "SELECT f.fer_ID as Ferienwohnung " +
                    "FROM dbsys46.Buchung b, dbsys46.beinhaltet i INNER JOIN dbsys46.Ferienwohnung f ON i.fer_ID = f.fer_ID " +
                    "WHERE f.land_name = '" + land + "'";

            String mySelectQuery4 = "CREATE OR REPLACE VIEW ferfertig AS " +
                    "SELECT b.ferienwohnung " +
                    "FROM ferbuchung b " +
                    "WHERE b.ferienwohnung NOT IN (SELECT * FROM ferdatum) " +
                    "GROUP BY b.ferienwohnung";

            stmt.executeQuery(mySelectQuery2);
            if (ausstattung.equals("")) {
                stmt.executeQuery(mySelectQuery31);
            } else {
                stmt.executeQuery(mySelectQuery3);
            }
            stmt.executeQuery(mySelectQuery4);

            rset = stmt.executeQuery(mySelectQuery);// Query ausf�hren
            while (rset.next()) {
                System.out.println(rset.getString("Ferienwohnung"));
                System.out.println(rset.getString("Sterne"));
            }

            System.out.println("Buchen?");
            try {
                System.out.println("EMail:");
                email = in.readLine();

                rset = stmt.executeQuery("SELECT kund_mailadresse FROM dbsys46.Kunde ");
                while (rset.next()) {
                    if (email.equals(rset.getString("kund_mailadresse"))) {
                        neuerKunde = false;
                    }

                }
                if (neuerKunde) {
                    System.out.println("Newsletter??????");
                    newsletter = in.readLine();
                    System.out.println("passwort");
                    passwort = in.readLine();
                    System.out.println("Name???");
                    kundname = in.readLine();
                    System.out.println("iban bitte");
                    iban = in.readLine();
                    System.out.println("Strasse");
                    strasse = in.readLine();
                    System.out.println("plz");
                    plz = in.readLine();
                    System.out.println("stadt");
                    stadt = in.readLine();
                    System.out.println("hausnummer");
                    hausnummer = in.readLine();
                    strassenr = strasse + hausnummer + plz;
                    adr_id = String.valueOf(strassenr.hashCode());
                    if (Integer.parseInt(adr_id) < 0) {
                        int zahl = Integer.parseInt(adr_id);
                        zahl = zahl * -1;
                        zahl = zahl / 1000000;
                    } else {
                        int zahl = Integer.parseInt(adr_id);
                        zahl = zahl / 1000000;
                    }

                    stmt.executeQuery("INSERT INTO dbsys46.Adresse VALUES(" + adr_id + ",'" + strasse + "'," + plz + ",'" + stadt + "'," + hausnummer + ")");
                    stmt.executeQuery("INSERT INTO dbsys46.Kunde VALUES('" + email + "'," + newsletter + ",'" + passwort + "','" + kundname + "','" + iban + "'," + adr_id + ")");

                }
                System.out.println("Ferienwohnungsname");
                fer_name = in.readLine();
                String mySelectQuery6 = "Select fer_ID from dbsys46.Ferienwohnung where fer_name = '" + fer_name + "'";


                rset = stmt.executeQuery(mySelectQuery6);
                if (rset.next())
                    ID = rset.getString("fer_ID");

                System.out.println("Anreisedatum");
                andatum = in.readLine();

                System.out.println("Abreisedatum");
                abdatum = in.readLine();

            } catch (IOException e) {
                System.out.println("Fehler");
                System.exit(-1);
            }
            long time = Long.hashCode(System.currentTimeMillis());
            if (time < 0) {
                time = time * -1;
                time = time / 10000;
                System.out.println(time);
            } else {
                time = time / 10000;
            }
            String mySelectQuery5 = "INSERT INTO dbsys46.Buchung VALUES (" + time + ",to_date(sysdate, 'DD.MM.YYYY')," + ID + ",'" + email + "',to_date('" + andatum + "', 'DD.MM.YYYY'),to_date('" + abdatum + "', 'DD.MM.YYYY'),to_date(sysdate, 'DD.MM.YYYY'),1,null,null,null)";
            //INSERT INTO dbsys47.Land VALUES (1,to_date(sysdate, 'DD.MM.YYYY')," + fer_name + ",'" + email + "',to_date('" + andatum + "', 'DD.MM.YYYY'),to_date('" + abdatum + "', 'DD.MM.YYYY'),to_date(sysdate, 'DD.MM.YYYY'),1,null,null,null)
            stmt.executeQuery(mySelectQuery5);

            stmt.executeQuery("Select * From dbsys46.Buchung");

            stmt.close();                                                                // Verbindung trennen
            conn.commit();
            conn.close();
        } catch (SQLException se) {                                                        // SQL-Fehler abfangen
            System.out.println();
            System.out
                    .println("SQL Exception occurred while establishing connection to DBS: "
                            + se.getMessage());
            System.out.println("- SQL state  : " + se.getSQLState());
            System.out.println("- Message    : " + se.getMessage());
            System.out.println("- Vendor code: " + se.getErrorCode());
            System.out.println();
            System.out.println("EXITING WITH FAILURE ... !!!");
            System.out.println();
            try {
                conn.rollback();                                                        // Rollback durchf�hren
            } catch (SQLException e) {
                e.printStackTrace();
            }
            System.exit(-1);
        }
    }
}
