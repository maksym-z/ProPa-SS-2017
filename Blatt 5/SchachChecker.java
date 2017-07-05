import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.Charset;

public class SchachChecker {
  public static final Map<Character, Class<? extends Schachbrett.Feld>> pieceMap =
      new HashMap<Character, Class<? extends Schachbrett.Feld>>() {
        {
          put('b', Schachbrett.Bauer.class);
          put('s', Schachbrett.Springer.class);
          put('l', Schachbrett.Laeufer.class);
          put('t', Schachbrett.Turm.class);
          put('d', Schachbrett.Dame.class);
          put('k', Schachbrett.Koenig.class);
          put(' ', Schachbrett.Feld.class);
        }
      };

  public static void main(String[] args) throws Exception {
    if (args.length < 1) {
      throw new RuntimeException("Parameter fehlt: Schachbrett");
    } else if (args.length < 2) {
      throw new RuntimeException("Parameter fehlt: wer ist am Zug?");
    }
    final boolean whiteToMove = "w".equals(args[1]);
    if (!(whiteToMove || "s".equals(args[1]))) {
      throw new RuntimeException("Unbekannte Farbe: '" + args[1] + "'");
    }
    final BufferedReader reader = Files.newBufferedReader(
        Paths.get(args[0]), Charset.forName("UTF-8"));
    final Schachbrett board = new Schachbrett();
    for (int lineIndex = 8; lineIndex >= 1; lineIndex--) {
      // Zeilen sind von unten nach oben durchnummeriert, deshalb ist die zuerst
      // eingelesene Zeile die mit der Nummer 8.
      final String line = reader.readLine();
      if (line == null) {
        throw new RuntimeException("Zu wenig Zeilen!");
      }
      for (char column = 'a'; column <= 'h'; column++) {
        final char cur =
            column - 'a' >= line.length() ? ' ' : line.charAt(column - 'a');
        final Class<? extends Schachbrett.Feld> pieceClass =
            pieceMap.get(Character.toLowerCase(cur));
        if (pieceClass == null) {
          throw new RuntimeException("Nicht erlaubtes Zeichen: '" + cur + "''");
        }
        Schachbrett.Feld f;
        if (cur == ' ') {
          // leeres Feld ist nicht schwarz oder weiß
          f = pieceClass.getConstructor().newInstance();
        } else {
          f = pieceClass.getConstructor(
              Boolean.TYPE).newInstance(Character.isUpperCase(cur));
        }
        board.setFeld(lineIndex, column, f);
      }
    }
    reader.close();
    Set<Schachbrett.Zug> zugSet = board.moeglicheZuege(whiteToMove);
    Schachbrett.Zug[] zuege = zugSet.toArray(new Schachbrett.Zug[zugSet.size()]);
    Arrays.sort(zuege);
    for (final Schachbrett.Zug zug: zuege) {
      System.out.println(zug.toString());
    }
  }
}