import java.lang.Comparable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
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
	
	private static final int[] directionSE = new int[]{-1,1};
	private static final int[] directionSW = new int[]{-1,-1};
	private static final int[] directionNE = new int[]{1,1};
	private static final int[] directionNW = new int[]{1,-1};
	
	private static final int[] directionS = new int[]{-1,0};
	private static final int[] directionN = new int[]{1,0};
	private static final int[] directionW = new int[]{0,-1};
	private static final int[] directionE = new int[]{0,1};

  public static class Feld {
  }

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
    
    /**
     * Get possible moves without considering the fields blocked by other pieces or check.
     * Returns list of lists of moves
     */
    public abstract ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom);
    
    /**
     * Returns possible attacks IN ADDITION to the moves returned by getMovesToCheck. Ignores possible checks. 
     * @param columnFrom
     * @param lineFrom
     * @return list of lists of moves
     */
    public abstract ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom);
    	// return new(ArrayList<ArrayList<Integer>>());
  }
  
  private static boolean onBoard(char columnFrom, int lineFrom) {
	  boolean lineInRange = (lineFrom >= 1 && lineFrom <= 8);
	  boolean columnInRange = (columnFrom >= (int) 'a' && columnFrom <= (int) 'h');
	  return lineInRange && columnInRange; 
  }
  

  public static final class Bauer extends Figur {
	private int direction;
    public Bauer(boolean white) { 
    	super(white); 
    	if (white) {
    		direction = 1;
    	} else {
    		direction = -1;
    	}
	}

	@Override
	public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		ArrayList<Integer> moves = new ArrayList<>();
		ArrayList<ArrayList<Integer>> queues = new ArrayList<>(); 
		if (lineFrom + direction < 8 && lineFrom + direction > 1) {
			moves.add(feldIndex(lineFrom + direction, columnFrom));
			if ((isWhite() && lineFrom == 2) || (!isWhite() && lineFrom == 7)) {
				moves.add(feldIndex(lineFrom + direction*2, columnFrom));
			}
		}
		queues.add(moves);
		return queues;
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		ArrayList<Integer> moves = new ArrayList<>();
		ArrayList<ArrayList<Integer>> queues = new ArrayList<>();
		if (lineFrom + direction < 8 && lineFrom + direction > 1) {
			if (columnFrom!='a') {
				moves.add(feldIndex(lineFrom + direction, (char) (columnFrom-1)));
			}
			if (columnFrom!='h') {
				moves.add(feldIndex(lineFrom + direction, (char) (columnFrom+1)));
			}
		}
		queues.add(moves);
		return queues;
	}
  }
  
  private static ArrayList<ArrayList<Integer>> allMovesInDirections(char columnFrom, int lineFrom, int[][] directions, int maxSteps) {
	  ArrayList<ArrayList<Integer>> queues = new ArrayList<>();
	  for(int[] direction: directions) {
			int x = lineFrom;
			int y = (int)columnFrom;
			ArrayList<Integer> moves = new ArrayList<>();
			int counter = 0;
			while (onBoard((char)(y+direction[0]),x+direction[1]) && counter<maxSteps) {
				y = (y+direction[0]);
				x = x+direction[1];
				moves.add(feldIndex(x, (char)y));
				counter++;
			}
			queues.add(moves);
			
		}
	  return queues;	  
  }

  public static final class Laeufer extends Figur {
    public Laeufer(boolean white) { 
    	super(white); 
	}

	@Override
	public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		int[][] directions = new int[][]{directionSE,directionSW,directionNE,directionNW};
		return allMovesInDirections(columnFrom, lineFrom, directions,8);
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		return new ArrayList<ArrayList<Integer>>();
	}
  }

  public static final class Springer extends Figur {
    public Springer(boolean white) { super(white); }
	@Override
	public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		int[][] directions = new int[][]{{2,-1},{2,1},{-2,1},{-2,-1},{1,2},{1,-2},{-1,2},{-1,-2}};
		return allMovesInDirections(columnFrom, lineFrom, directions,1);
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		return new ArrayList<ArrayList<Integer>>();
	}
  }

  public static final class Turm extends Figur {
    public Turm(boolean white) { super(white); }
	@Override
	public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		int[][] directions = new int[][]{directionN,directionE,directionS,directionW};
		return allMovesInDirections(columnFrom, lineFrom, directions,8);
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		return new ArrayList<ArrayList<Integer>>();
	}
  }

  public static final class Dame extends Figur {
    public Dame(boolean white) { super(white); }
    public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		int[][] directions = new int[][]{directionSE,directionSW,directionNE,directionNW,directionN,directionE,directionS,directionW};
		return allMovesInDirections(columnFrom, lineFrom, directions,8);
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		return new ArrayList<ArrayList<Integer>>();
	}
  }

  public static final class Koenig extends Figur {
    public Koenig(boolean white) { super(white); }
    public ArrayList<ArrayList<Integer>> getMovesToCheck(char columnFrom, int lineFrom) {
		int[][] directions = new int[][]{directionSE,directionSW,directionNE,directionNW,directionN,directionE,directionS,directionW};
		return allMovesInDirections(columnFrom, lineFrom, directions,1);
	}

	@Override
	public ArrayList<ArrayList<Integer>> getAttacksToCheck(char columnFrom, int lineFrom) {
		// TODO Auto-generated method stub
		return new ArrayList<ArrayList<Integer>>();
	}

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
  
  private int getFieldLine(int fieldIndex) {
	  return fieldIndex / 8 + 1;
  }
  
  private char getFieldColumn(int fieldIndex) {
	  return (char)(fieldIndex % 8 + (int)'a');
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
  
  private static final int FRIENDLY = 1;
  private static final int ENEMY = 2;
  private static final int OH_NOES_IZ_OUR_KING = 3;
  
  private int isOccupied(Feld field, boolean whiteToMove) {
	  if(field instanceof Figur) {
		  if (((Figur)field).white == whiteToMove) {
			  return FRIENDLY;
		  } else {
			  return ENEMY;
		  }
	  } else {
		  return 0;
	  }
  }

  public Set<Zug> moeglicheZuege(boolean whiteToMove) {
    /*
     * -------------------------------------------------------------------------
     * Veränderbarer Teil: Algorithmus
     * -------------------------------------------------------------------------
     */
	  
	  // Some spaghetti code follows.
	  // In general, I find this a strange OO design to say the least:
	  // - Figur inherits from Feld (what do they have in common?); 
	  // - a Figur does not have any information about its position on the board;
	  HashSet<Zug> potentialMoves = new HashSet<>();
	  int kingAt = -1;
	  int index = 0;
	  for (Feld field: felder) {
		  int line = index / 8 + 1;
		  char column = (char) ( index % 8 + (int)'a');
		  if (field instanceof Koenig && ((Figur)field).white == whiteToMove) {
			  kingAt = index;
		  }
		  if (field instanceof Figur && ((Figur)field).white == whiteToMove) {
			  Figur piece = (Figur)field;
			  for (ArrayList<Integer> queue: piece.getMovesToCheck(column,line)) {
				  int i=0;
				  boolean obstacle = false;
				  while (i<queue.size() && !obstacle) {
					  Feld currentField = felder[queue.get(i)];
					  switch(isOccupied(currentField, whiteToMove)) {
					  case 0:
						  potentialMoves.add(new Zug(line, column, getFieldLine(queue.get(i)), getFieldColumn(queue.get(i)),piece.id()));
						  break;
					  case FRIENDLY:
						  obstacle = true;
						  break;
					  case ENEMY:
						  obstacle = true;
						  if (!(currentField instanceof Koenig)) {
							  potentialMoves.add(new Zug(line, column, getFieldLine(queue.get(i)), getFieldColumn(queue.get(i)),piece.id()));
						  }
						  break;
					  }
					  i++;
				  }
			  };
			  System.out.println(piece.id() + "" + column + "" + line + ", possible attack: " + piece.getAttacksToCheck(column,line).size());
			  for (ArrayList<Integer> queue: piece.getAttacksToCheck(column,line)) {
				  int i=0;
				  boolean obstacle = false;
				  while (i<queue.size() && !obstacle) {
					  Feld currentField = felder[queue.get(i)];
					  switch(isOccupied(currentField, whiteToMove)) {
					  case 0:
						  break;
					  case FRIENDLY:
						  obstacle = true;
						  break;
					  case ENEMY:
						  obstacle = true;
						  if (!(currentField instanceof Koenig)) {
							  potentialMoves.add(new Zug(line, column, getFieldLine(queue.get(i)), getFieldColumn(queue.get(i)),piece.id()));
						  }
						  break;
					  }
					  i++;
				  }
			  };
		  }
		  index++;
	  }
	  // Now check if the enemy can attack our king.
	  // No one said it has to be efficient or look nice
	  HashSet<Zug> illegalMoves = new HashSet<>();
	  for (Zug move: potentialMoves) {
		  
		  int emptyFieldIndex = feldIndex(move.lineFrom,(char) (move.columnFrom));
		  int occupiedFieldIndex = feldIndex(move.lineTo,(char) (move.columnTo));
		  
		  int kingFieldIndex = kingAt;
		  if (move.pieceId == 'K' && ((Figur)getFeld(move.lineFrom,(char) (move.columnFrom))).isWhite() == whiteToMove) {
			  System.out.println("King on the move!");
			  kingFieldIndex = feldIndex(move.lineTo,(char) (move.columnTo));
		  } else {
			  System.out.println(move.pieceId);
		  }
		  // TODO: attacks for pawns!
		  System.out.println("Move " + move + ", from " + emptyFieldIndex + " to " + occupiedFieldIndex + ", king at " + kingFieldIndex);
		  index = 0;
		  for (Feld field: felder) {
			  int line = index / 8 + 1;
			  char column = (char) ( index % 8 + (int)'a');
			  boolean blackToMove = !whiteToMove;
			  if (field instanceof Figur && ((Figur)field).white == blackToMove && index!=occupiedFieldIndex) {
				  System.out.println("Checking figure at " + index);
				  Figur enemyPiece = (Figur)field;
				  for (ArrayList<Integer> queue: enemyPiece.getMovesToCheck(column,line)) {
					  int i=0;
					  boolean obstacle = false;
					  while (i<queue.size() && !obstacle) {
						  Feld currentField = felder[queue.get(i)];
						  int isOccupiedAfterThisMove = isOccupied(currentField, whiteToMove);
						  if (occupiedFieldIndex == queue.get(i)) {
							  isOccupiedAfterThisMove = FRIENDLY;
						  }
						  if (kingFieldIndex == queue.get(i)) {
							  isOccupiedAfterThisMove = OH_NOES_IZ_OUR_KING;
							  System.out.println("OH NOES");
						  }
						  if (emptyFieldIndex == queue.get(i)) {
							  isOccupiedAfterThisMove = 0;
						  }
						  switch(isOccupiedAfterThisMove) {
						  case 0:
							  break;
						  case FRIENDLY:
						  case ENEMY:
							  obstacle = true;
							  break;
						  case OH_NOES_IZ_OUR_KING:
							  System.out.println("Move " + move.toString() + " illegal");
							  illegalMoves.add(move);
							  obstacle = true;
							  break;
						  }
						  i++;
					  }
				  };
			  }
			  index++;
		  }
	  }
	  potentialMoves.removeAll(illegalMoves);
     return potentialMoves;
     // Ende
  }

private int getFeldIndex(char column, int line) {
	// TODO Auto-generated method stub
	return 0;
}
}
