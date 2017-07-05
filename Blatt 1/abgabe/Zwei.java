import java.lang.Integer;
import java.lang.String;
import java.lang.System;

public class Zwei {
	private static final int MAX_SCORE_PER_EXERCISE = 10;
    public static void main(final String[] args) {
    	
    	int sum = 0;
    	
        System.out.println("Got the following arguments:");
        for (final String arg: args) {
            final int val = Integer.parseInt(arg);
            sum += val;
            System.out.println(" - " + Integer.toString(val));
        }
        
        int mean = sum / args.length;
        System.out.println(mean);
        if (mean >= MAX_SCORE_PER_EXERCISE / 2) {
        	System.out.println("Ja");
        } else {
        	System.out.println("Nein");
        }
    }
}