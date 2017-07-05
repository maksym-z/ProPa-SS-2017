

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {

	public static void main(String[] args) throws Exception {
		InputStreamReader isr = null;
		BufferedReader br = null;

		try {
			// Aus übergebener Datei oder Standard-In lesen
			if (args.length == 1)
				isr = new FileReader(args[0]);
			else
				isr = new InputStreamReader(System.in);

			br = new BufferedReader(isr);

			final ArrayList<Schachtel> v = new ArrayList<Schachtel>();
			long zielgewicht;
			int n;

			String[] line;

			// Die erste Zeile enthält "zielgewicht" und "n"
			line = br.readLine().split(" ");
			zielgewicht = Integer.parseInt(line[0]);
			n = Integer.parseInt(line[1]);

			// Die nächsten n Zeilen enthalten dann die Potenz und Anzahl der Gewichte
			for (int i = 1; i <= n; i++) {
				line = br.readLine().split(" ");
				v.add(new Schachtel(Integer.parseInt(line[0]), Long.parseLong(line[1]), "" + i));
			}
			
			// Alle weiteren Zeilen werden ignoriert.

			List<Schachtel> ss = Loesung.loese(zielgewicht, v);
			if (ss == null) {
				System.out.println("Nicht möglich!");
				return;
			}
			
			// Die Lösung wird in sortierter Reihenfolge ausgeggeben
			
			Collections.sort(ss);
			Collections.reverse(ss);
			
			System.out.println(ss.size());
			
			for (Schachtel s : ss) 
				System.out.print(s.getId() + " ");
			System.out.println("");
		} finally {
			if (br != null)
				br.close();
			if (isr != null)
				isr.close();
		}
	}
}
