import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.PriorityQueue;

public class Loesung {
  
  private static final int MAX_INT = 8001;

  private static long tenToPowerOf(int exponent) {
    return (long) Math.pow(10, exponent);
  }
  
  static long[] initCounts;
  static int bestResultSoFar = MAX_INT;
  static Vertex bestResult;
  static int[] powers;
  static int nodesVisited;
  
  static class Vertex implements Comparable<Vertex> {
    PriorityQueue<Vertex> children = new PriorityQueue<>();
    Vertex parent;
    
    long weightRemaining;
    int index;
    int touchedCount;
    boolean[] touchedPockets;
    long[] counts;
    boolean visited = false;
    long steps;
    
    Vertex (Vertex root, int boxIndex, long parentWeight, long steps2) {
      index = boxIndex;
      parent = root;
      this.steps = steps2;
      if (root!=null) {
        touchedCount = parent.touchedCount;
        touchedPockets = Arrays.copyOf(parent.touchedPockets,parent.touchedPockets.length);
        counts = Arrays.copyOf(parent.counts,parent.counts.length);
        counts[boxIndex]-=steps;
        if (!touchedPockets[boxIndex]) {
          touchedPockets[boxIndex] = true;
          touchedCount++;
        }
        weightRemaining = parentWeight - tenToPowerOf(powers[boxIndex])*steps2;
      } else {
        // Root init
        touchedCount = 0;
        touchedPockets = new boolean[initCounts.length];
        counts = Arrays.copyOf(initCounts,initCounts.length);
        for (int i = 0; i<counts.length; i++) {
          touchedPockets[i]=false;
        }
        weightRemaining = parentWeight;
      }
    }
    
    /**
     * Branch the decision tree at this vertex.
     */
    void produceChildren() {
      for (int i = counts.length-1; i >= 0; i--) {
        if (tenToPowerOf(powers[i]) <= weightRemaining && counts[i]>0) {
          long steps = Math.min(counts[i],weightRemaining/tenToPowerOf(powers[i]));
          children.add(new Vertex(this,i,weightRemaining,steps));
        } 
      }
    }

    /**
     * The "bound" part of branch-and-bound.
     * @return true if visiting this node can improve the result, else false
     */
    public boolean canImproveResult() {
      if ((touchedPockets[index] && touchedCount < bestResultSoFar) || (!touchedPockets[index] && touchedCount + 1 < bestResultSoFar)) {
        if (touchedPockets[index] && bestResultSoFar - touchedCount == 1 && counts[index]*tenToPowerOf(powers[index]) < weightRemaining) {
          return false;
        }
        return true;
      } else {
        return false;
      }
    }

    @Override
    public int compareTo(Vertex other) {
      
      if (other.touchedCount > this.touchedCount) {
        if (other.weightRemaining >= this.weightRemaining) {
          return -1;
        } else {
          return 0;
        }
      } else {
        if (other.weightRemaining <= this.weightRemaining) {
          return 1;
        } else {
          return 0;
        }
      }
    }
  }
  
  /**
   * Travere the tree recursively
   * @param vertex
   * @return remaining weight
   */
  private static long visitRecursively(Vertex vertex) {
    assert (!vertex.visited);
    vertex.visited = true;
    nodesVisited++;
    if (vertex.weightRemaining < 0) {
      throw (new IllegalArgumentException());
    } else {
      vertex.produceChildren();
      while (!vertex.children.isEmpty()) {
        Vertex child = vertex.children.poll();
        if (child.canImproveResult()) {
          long childResult = visitRecursively(child);
          if (childResult == 0) {
            updateBestResultSoFar(child);
          }
        }
      }
    }
    return vertex.weightRemaining;
  }

  private static void updateBestResultSoFar(Vertex vertex) {
    if (bestResultSoFar > vertex.touchedCount) {
      bestResultSoFar = vertex.touchedCount;
      bestResult = vertex;
    }
  }

  private static void initArrays(List<Schachtel> schachteln) {
    powers = new int[schachteln.size()];
    initCounts = new long[schachteln.size()];
    int index = 0;
    for (Schachtel s: schachteln) {
      powers[index]=s.getPotenz();
      initCounts[index]=s.getAnzahl();
      index++;
    }
  }
  
   // Wenn Sie moechten, koennen sie innerhalb dieser Klasse einige Hilfsfunktionen
   // definieren. Die Musterloesung kommt ohne solche Hilfsfunktionen aus.
  public static List<Schachtel> loese(long zielgewicht, List<Schachtel> schachteln) {
      // Implementieren Sie diese Funktion
    initArrays(schachteln);
    Vertex root = new Vertex(null, 0, zielgewicht,0);
    nodesVisited = 0;
    visitRecursively(root);
    if (bestResult==null) {
      return null;
    } else {
      return removeUnused(schachteln);
    }
  }

  private static List<Schachtel> removeUnused(List<Schachtel> schachteln) {
    ArrayList<Schachtel> returnList = new ArrayList<>();
    for (int i = 0; i<schachteln.size();i++) {
      if (bestResult.touchedPockets[i]) {
        returnList.add(schachteln.get(i));
      }
    }
    return returnList;
  }
}
