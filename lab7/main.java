 
import java.lang.String;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class main {
	
	private static Connection dbconn = null;
	
	private static void connectDatabase(Scanner input, String database) throws SQLException {
		
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			dbconn = DriverManager.getConnection(database);
			System.out.println("Connected to Database");
			//menu(input);
		}
		catch(SQLException e)
        {
          // if the error message is "out of memory",
          // it probably means no database file is found
          System.err.println("DB Connection: " + e.getCause());
          return;
        }
	}
	
	private static void disconnectDatabase() throws SQLException {
		// Disconnect from the Database:
		if(dbconn != null) {
            dbconn.close();
            System.out.println("Disconnected to Database. Terminating Program");
		}
	}

	private static void CreateTable() throws SQLException {
		
		Statement state = null;
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		String SQLQuery = "CREATE TABLE IF NOT EXISTS warehouse (";
			SQLQuery += "w_warehousekey DECIMAL(3,0) NOT NULL,"; 
			SQLQuery += "w_name CHAR(25) NOT NULL,"; 
			SQLQuery += "w_supplierkey DECIMAL(2,0) NOT NULL,"; 
			SQLQuery += "w_capacity DECIMAL(6,2) NOT NULL,"; 
			SQLQuery += "w_address VARCHAR(40) NOT NULL,"; 
			SQLQuery += "w_nationkey DECIMAL(2,0) NOT NULL";
		SQLQuery += ");";
		
		try {
			state.executeUpdate(SQLQuery);
		}
		catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
	}
	
	private static void AddWarehouse(Scanner input) throws SQLException, InterruptedException {
		
		String name, supplier, address, nation;
		int capacity;
		System.out.print("Name: "); 
		name = input.next();
		
		System.out.print("Supplier: "); 
		supplier = input.next() + input.nextLine();
		input.reset();

		System.out.print("Capacity: "); 
		capacity = input.nextInt();
		input.reset();

		System.out.print("Address: "); 
		address = input.next() + input.nextLine();
		
		System.out.print("Nation: "); 
		nation = input.nextLine();
		
		
		
		
		
		Statement state = null;
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		String SQLQuery = "";
		//ResultSet result = null;
		int supp_key = 0, n_key = 0, totalRows = 0;
		/*
		 * Check if supplier exists
		 */
		
		SQLQuery = "SELECT s_suppkey FROM supplier WHERE s_name = '" + supplier + "';";
		try (ResultSet result = state.executeQuery(SQLQuery)){
			
			supp_key = result.getInt("s_suppkey");
			
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Supplier SQL Result:" + e.getCause());
			return;
		}

		
		/*
		 * Check if nation exists
		 */
		SQLQuery = "SELECT n_nationkey FROM nation WHERE n_name = '" + nation.toUpperCase() + "';";
		try (ResultSet result = state.executeQuery(SQLQuery)){
			n_key = result.getInt("n_nationkey");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Nation SQL Result:" + e.getCause());
			return;
		}
		/*
		 * Check the number of rows in warehouse
		 */
		SQLQuery = "SELECT COUNT(w_warehousekey) AS total FROM warehouse;";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			totalRows = result.getInt("total") + 1;
			result.close();
		}
		catch (SQLException e) {
			//System.err.println("Total Row SQL Result:" + e.getCause());
			//return;
			totalRows = 1;
		}
		
		
		/*
		 * If all checks passes
		 */
		SQLQuery = "INSERT INTO warehouse (w_warehousekey, w_name, w_supplierkey, w_capacity, w_address, w_nationkey) VALUES ";
		SQLQuery += "(" + totalRows + ","; // w_warehousekey
		SQLQuery += "'" + name + "',"; // w_name
		SQLQuery += "'" + supp_key + "',"; // w_supplierkey
		SQLQuery += capacity + ","; // w_capacity
		SQLQuery += "'" + address + "',"; // w_address
		SQLQuery += "" + n_key + ");"; // w_nationkey
		try {
			state.executeUpdate(SQLQuery);
			System.out.println("Insertion Complete!");
		}
		catch (SQLException e) {
			System.err.println("Insertion SQL:" + e.getErrorCode());
		}
		
	}
	
	private static String findMinWarehouse() throws SQLException {
		
		String SQLQuery = "";
		Statement state = null;
	
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		SQLQuery = "SELECT s_name, COUNT(w_supplierkey) AS num_ware FROM supplier, warehouse WHERE s_suppkey = w_supplierkey GROUP BY s_name";
		//System.out.println(SQLQuery);
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			int min = Integer.MAX_VALUE;
			String suppName = "";
			while(result.next()) {
				if(min == result.getInt("num_ware")) {
					continue;
				}
				else if(result.getInt("num_ware") < min) {
					min = result.getInt("num_ware");
					suppName = result.getString("s_name");
				}
			}
			System.out.println("Supplier with the smallest warehouse capacity: " + suppName);
			result.close();
		}
		catch (SQLException e) {
			System.err.print("Selection Query 1: " + e.getCause());
		}
		
		return "";
	}
	
	private static void findMaxWarehouseCapacity() throws SQLException  {
		String SQLQuery = "";
		Statement state = null;
	
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		SQLQuery = "SELECT S.s_name AS s_name, W.w_name AS w_name, MAX(w_capacity) AS max_cap FROM supplier S, warehouse W WHERE S.s_suppkey = W.w_supplierkey GROUP BY S.s_suppkey;";
		
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			System.out.println("Supplier\t\tWarehouse\t\tCapacity");
			while(result.next()) {
				System.out.println(result.getString("s_name") + "\t" + result.getString("w_name") + "\t" + result.getInt("max_cap"));
			}
			result.close();
		}
		catch (SQLException e) {
			System.err.print("Selection Query 2: " + e.getCause());
		}
	}
	
	private static void findWarehouseInEurope(Scanner input) throws SQLException {
		String SQLQuery = "";
		Statement state = null;
		
		
		int X = input.nextInt();
	
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		SQLQuery = "SELECT DISTINCT w_name, w_capacity, n_name FROM warehouse, nation, region WHERE" + 
				" w_nationkey = n_nationkey AND" + 
				" n_regionkey = r_regionkey AND" + 
				" r_name = 'EUROPE' AND" + 
				" w_capacity < " + X + " GROUP BY w_name";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			System.out.println("Warehouse\t\tCapacity\t\tCountry");
			while(result.next()) {
				System.out.println(result.getString("w_name") + "\t" + result.getInt("w_capacity") + "\t\t" + result.getString("n_name"));
			}
		}
		catch (SQLException e) {
			System.err.print("Selection Query 3: " + e.getCause());
		}
		
	}
	
	private static void checkStorageSizeForSupp(Scanner input) throws SQLException {
		String SQLQuery = "";
		Statement state = null;
		
		String name, supplier, address, nation;
		int capacity;
		System.out.print("Enter supplier name: ");
		String suppName = input.next();
		

		int supp_id = -1, total_capacity = 0, total_quantity = 0;
	
		state = dbconn.createStatement();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		SQLQuery = "SELECT s_suppkey FROM supplier WHERE s_name = '" + suppName + "';";
		
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			supp_id = result.getInt("s_suppkey");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 4: " + e.getCause());
			return;
		}
		
		SQLQuery = "SELECT SUM(w_capacity) AS total_capacity FROM warehouse WHERE w_supplierkey = " + supp_id + ";";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			total_capacity = result.getInt("total_capacity");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 5: " + e.getCause());
			return;
		}
		
		SQLQuery = "SELECT SUM(ps_availqty) AS total_quantity FROM partsupp WHERE ps_suppkey = " + supp_id + ";";
		
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			total_quantity = result.getInt("total_quantity");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 6: " + e.getCause());
			return;
		}
		
		if(total_capacity < total_quantity) {
			System.err.println(suppName + " does not have enough warehouse space for all of its supply");
			System.err.println(suppName + " total warehouse capacity: " + total_capacity);
			System.err.println(suppName + " total supply quantity: " + total_quantity);
		}
		else {
			System.out.println(suppName + " has enough warehouse space for all of its supply");
			System.out.println(suppName + " total warehouse capacity: " + total_capacity);
			System.out.println(suppName + " total supply quantity: " + total_quantity);
		}
	}
	
	private static void listWarehouseInCountry(Scanner input) throws SQLException {
		
		Statement state = dbconn.createStatement();
		String SQLQuery = "";
		System.out.print("Enter country name: ");
		String nation = input.next();
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		SQLQuery = "SELECT w_name, w_capacity FROM warehouse, nation WHERE w_nationkey = n_nationkey AND n_name = '" + nation.toUpperCase() + "' ORDER BY w_capacity DESC;";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			System.out.println("Warehouse\t\tCapacity");
			while(result.next()) {
				System.out.println(result.getString("w_name") + "\t" + result.getInt("w_capacity"));
			}
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 7: " + e.getCause());
			return;
		}
	}
	
	private static void updateWarehouseOwnership(Scanner input) throws SQLException {
		Statement state = dbconn.createStatement();
		String SQLQuery = "";
		state.setQueryTimeout(30);  // set timeout to 30 sec.
		
		System.out.print("Enter the supplier name that is being acquired: ");
		String supp1 = input.next();
		System.out.print("Enter the supplier that aquired " + supp1 + ": ");
		String supp2 = input.next();
		
		int supp_key1 = 0, supp_key2 = 0;
		
		SQLQuery = "SELECT s_suppkey FROM supplier WHERE s_name = '" + supp1 +"';";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			supp_key1 = result.getInt("s_suppkey");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 8: " + e.getCause());
			return;
		}
		
		SQLQuery = "SELECT s_suppkey FROM supplier WHERE s_name = '" + supp2 +"';";
		try (ResultSet result = state.executeQuery(SQLQuery)) {
			supp_key2 = result.getInt("s_suppkey");
			result.close();
		}
		catch (SQLException e) {
			System.err.println("Selection Query 9: " + e.getCause());
			return;
		}
		
		SQLQuery = "UPDATE warehouse SET w_supplierkey = " + supp_key2 + " WHERE w_supplierkey = " + supp_key1 + ";";
		try{
			state.executeUpdate(SQLQuery);
			System.out.println(supp2 + " has now acquired " + supp1 + " all warehose of " + supp1 + " are now updated and set its owner to " + supp2);
		}
		catch(SQLException e) {
			System.err.println("Update Query: " + e.getCause());
			return;
		}
	}
	
	private static void menu(Scanner myInput) throws SQLException, InterruptedException {
		int menu = 0;
		System.out.println();
		System.out.println("These are your following choices: ");
		System.out.println("1 - Connect to Database");
		System.out.println("2 - Create warehouse table");
		System.out.println("3 - Insert a tuple");
		System.out.println("4 - Find supplier with the smallest number of warehouses");
		System.out.println("5 - Find the maximum warehouse capacity across all the suppliers");
		System.out.println("6 - List all the warehouses inEUROPEwith capacity smaller thanX, whereXis taken as an input fromthe user");
		System.out.println("7 - For a supplier name given by the user, find whether all its warehouses are capable to fit all itsproducts ");
		System.out.println("8 - For a nation given by the user, print all the warehouses in that country, in descending order oftheir capacity.");
		System.out.println("9 - Supplier#000000002 is acquired by Supplier#000000001. Update thewarehousetable to reflectthis change in ownership.  The actual names of the suppliers are taken as input from the user,they are not constants.");
		System.out.println("10 - Disconnect to Database and terminate program");
		System.out.print("Select an option from above: ");
		myInput.reset();
		menu = myInput.nextInt();
		
		switch(menu) {
			case 1:
			//Connect to DB
				if(dbconn == null)
					connectDatabase(myInput, "jdbc:sqlite:../TPCH.db");
				else 
					System.err.println("Already connected to database");
				break;
			case 2:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else 
					CreateTable();
				break;
			
			case 3:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else {
					AddWarehouse(myInput);
				}
				break;
				
				
			case 4:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else
					findMinWarehouse();
				break;
			
			case 5:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else
					findMaxWarehouseCapacity();
				break;
				
			case 6:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else {
					System.out.print("Enter minimum capacity: ");
					findWarehouseInEurope(myInput);
				}
				break;
				
			case 7:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else {
					checkStorageSizeForSupp(myInput);
				}
				break;
				
			case 8:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else {
					listWarehouseInCountry(myInput);
				}
				
				break;
				
			case 9:
				if(dbconn == null)
					System.err.println("Not connected to database");
				else {
					updateWarehouseOwnership(myInput);
				}
				
				break;
				
			case 10:
				disconnectDatabase();
				return;
				
			default:
				System.err.println("You have entered an invalid option. Choose again");
		}
		menu(myInput);
	}
	
	public static void main(String[] args) throws SQLException, InterruptedException {
		// Connect to a database
		Scanner myInput = new Scanner(System.in);
		myInput.useDelimiter("\n");
		menu(myInput);
		myInput.close();
		return;
	}

}
