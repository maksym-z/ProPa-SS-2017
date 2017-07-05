import java.lang.Comparable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public class Schachbrett {
  /**
   * ---------------------------------------------------------------------------
   * Veränderbarer Teil: Klassen für die einzelnen Figuren auf den Feldern.
   * ---------------------------------------------------------------------------
   *
   * Hinweis: Die Konstruktoren müssen erhalten bleiben.
   */

  public static class Feld {}

  /**
   * Ein Feld, auf dem eine Figur steht.
   * Die Figur ist entweder weiß oder schwarz.
   */
  public static abstract class Figur extends Feld {
    final boolean white;
    protected Figur(boolean white) { this.white = white; }

    public boolean isWhite() { return white; }

    public char id() {
      return getClass().getSimpleName().charAt(0);
    }
  }

  public static final class Bauer extends Figur {
    public Bauer(boolean white) { super(white); }
  }

  public static final class Laeufer extends Figur {
    public Laeufer(boolean white) { super(white); }
  }

  public static final class Springer extends Figur {
    public Springer(boolean white) { super(white); }
  }

  public static final class Turm extends Figur {
    public Turm(boolean white) { super(white); }
  }

  public static final class Dame extends Figur {
    public Dame(boolean white) { super(white); }
  }

  public static final class Koenig extends Figur {
    public Koenig(boolean white) { super(white); }
  }

  /**
   * ---------------------------------------------------------------------------
   * Ende Veränderbarer Teil: Klassen für die einzelnen Figuren auf den Feldern.
   * ---------------------------------------------------------------------------
   */

  /**
   * Array, welches alle Felder des Schachbretts enthält. Zugriff erfolgt
   * mit getFeld(line, column), siehe unten.
   */
  private final Feld[] felder = new Feld[64];

  /**
   * Initialisierung: alle Felder leer.
   */
  {
    for (int i = 0; i < 64; ++i) {
      felder[i] = new Feld();
    }
  }

  private static int feldIndex(int line, char column) {
    return (line - 1) * 8 + ((int) column - (int) 'a');
  }

  public Feld getFeld(int line, char column) {
    return felder[feldIndex(line, column)];
  }

  public void setFeld(int line, char column, Feld value) {
    felder[feldIndex(line, column)] = value;
  }

  /**
   * Ein Zug der Figur FigurId vom Feld (lineFrom, columnFrom) auf das Feld
   * (lineTo, columnTo)
   */
  public final class Zug implements Comparable<Zug> {
    public int lineFrom, lineTo;
    public char columnFrom, columnTo;
    public char pieceId;

    public Zug (int lineFrom, char columnFrom, int lineTo, char columnTo,
                char pieceId) {
      this.lineFrom = lineFrom; this.columnFrom = columnFrom;
      this.lineTo = lineTo; this.columnTo = columnTo;
      this.pieceId = pieceId;
    }

    @Override
    public String toString() {
      return new StringBuilder().append(pieceId).append(columnFrom).append(
          Integer.toString(lineFrom)).append('-').append(columnTo).append(
          Integer.toString(lineTo)).toString();
    }

    // nötige Methoden für die Sortierung bei der Ausgabe
    @Override
    public int hashCode() {
      final int fromIndex = feldIndex(lineFrom, columnFrom);
      final int toIndex = feldIndex(lineTo, columnTo);
      int pieceIndex;
      switch(Character.toUpperCase(this.pieceId)) {
        case 'B': pieceIndex = 0; break;
        case 'S': pieceIndex = 1; break;
        case 'L': pieceIndex = 2; break;
        case 'T': pieceIndex = 3; break;
        case 'D': pieceIndex = 4; break;
        case 'K': pieceIndex = 5; break;
        default: throw new RuntimeException("Can never happen");
      }
      if (Character.isUpperCase(pieceIndex)) {
        pieceIndex = pieceIndex + 6;
      }
      // perfekter hash (Feldindex ist maximal 63 == 2^6 - 1)
      return toIndex + (fromIndex << 6) + (pieceIndex << 12);
    }

    public int compareTo(final Zug other) {
      return hashCode() - other.hashCode();
    }
  }

  public Set<Zug> moeglicheZuege(boolean whiteToMove) {
    /*
     * -------------------------------------------------------------------------
     * Veränderbarer Teil: Algorithmus
     * -------------------------------------------------------------------------
     */
     return Collections.<Zug>emptySet();
     // Ende
  }
}
