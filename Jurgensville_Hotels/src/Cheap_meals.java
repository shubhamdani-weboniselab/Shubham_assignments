import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

import javax.print.attribute.standard.PresentationDirection;

import com.opencsv.CSVReader;

public class Cheap_meals {

	public boolean hasfood(String arr[], String comp) {
		for (int i = 0; i < arr.length; i++) {
			if (arr[i].contains(comp)) {
				return true;
			}
		}

		return false;
	}

	public int get_restaurants_id(String Data_structure[][], String meal) {

		for (int ivar_x = 0; ivar_x < Data_structure.length; ivar_x++) {
			for (int ivar_y = 0; ivar_y < Data_structure[ivar_x].length; ivar_y++) {
				if ((hasfood(Data_structure[ivar_x], meal)) == true) {
					return Integer.parseInt(Data_structure[ivar_x][0]);
				}
			}
		}
		return 100;
	}

	public boolean Present_in_restaurants(String data_structure[][],
			String... Variable_args) {
		boolean value = false;

		for (int ivar = 0; ivar < Variable_args.length - 1;) {

			if (get_restaurants_id(data_structure, Variable_args[ivar]) == get_restaurants_id(
					data_structure, Variable_args[++ivar])) {
				value = true;
			} else {
				return false;
			}
		}

		return value;
	}

	public float Calculate_price(String data_structure[][],
			String... Variable_args) {
		float price = 0;
		// int idd;
		for (int ivar = 0; ivar < Variable_args.length; ivar++) {
			// idd = get_rest_id(next, str[i]);
			price = price
					+ (float) get_price(Variable_args[ivar], data_structure);
			// System.out.println(get_price(idd,next ));

		}
		return price;
	}

	public float get_price(String food, String data_structure[][]) {

		for (int ivar_k = 0; ivar_k < data_structure.length; ivar_k++) {
			if (data_structure[ivar_k][2].contains(food)) {
				return Float.parseFloat((data_structure[ivar_k][1]));
			}
		}

		return 0;
	}

	public float get_price(String food, String[] strings) {
		// TODO Auto-generated method stub
		for (int ivar = 0; ivar < strings.length; ivar++) {
			if (strings[2].contains(food)) {
				return Float.parseFloat(strings[1]);
			}
		}
		return 0;
	}

	public String find_cheap_one(String data_structure[][], String food) {
		float Min_price = 99;
		int id = 0;
		for (int ivar = 0; ivar < data_structure.length - 1; ivar++) {

			if (hasfood(data_structure[ivar], food)) {
				if (Min_price > Float.parseFloat((data_structure[ivar][1]))) {

					Min_price = Float.parseFloat((data_structure[ivar][1]));
					id = Integer.parseInt(data_structure[ivar][0]);

				}
			}
		}
		return "" + id + ", " + Min_price + "";
	}

	public static int countLines(String filename) throws IOException {
		InputStream is = new BufferedInputStream(new FileInputStream(filename));
		try {
			byte[] c = new byte[1024];
			int count = 0;
			int readChars = 0;
			boolean empty = true;
			while ((readChars = is.read(c)) != -1) {
				empty = false;
				for (int i = 0; i < readChars; ++i) {
					if (c[i] == '\n') {
						++count;
					}
				}
			}
			return (count == 0 && !empty) ? 1 : count;
		} finally {
			is.close();
		}
	}

	public static void main(String args[]) throws IOException {

		String path = "";
		try {
			path = args[0];
		} catch (ArrayIndexOutOfBoundsException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out
					.println("too few arguments please Enter the proper arguments \n"
							+ "\ne.g. program sample_data.csv <argument1> <...> ");
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("NO file found Enter the proper arguments \n"
					+ "\ne.g. program sample_data.csv <argument1> <...> ");
		} 

		CSVReader reader = new CSVReader(new FileReader(path));

		String data_structure[][] = new String[countLines(path)][];
		String temp[];
		int i = 0;
		while ((temp = reader.readNext()) != null) {

			data_structure[i] = temp;
			i++;
		}

		Cheap_meals obj = new Cheap_meals();

		switch (args.length) {
		case 0:
			System.out
					.println("too few arguments please Enter the proper arguments \n"
							+ "\ne.g. program sample_data.csv <argument1> <...> ");
		case 1:
			System.out
					.println("too few arguments please Enter the proper arguments \n"
							+ "\ne.g. program sample_data.csv <argument1> <...> ");
			break;
		case 2:
			System.out.println(obj.find_cheap_one(data_structure, args[1]));

			break;
		default:

			if (obj.Present_in_restaurants(data_structure, args)) {

				System.out.print(obj
						.get_restaurants_id(data_structure, args[1]) + ", ");

				System.out.println(obj.Calculate_price(data_structure, args));

			} else {
				System.out.println("not present in any rest");

			}

		}

	}

}
