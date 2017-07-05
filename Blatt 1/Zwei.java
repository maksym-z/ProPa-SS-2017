import java.lang.Integer;
import java.lang.String;
import java.lang.System;

public class Zwei {
    public static void main(final String[] args) {
        System.out.println("Got the following arguments:");
        for (final String arg: args) {
            final int val = Integer.parseInt(arg);
            System.out.println(" - " + Integer.toString(val));
        }
    }
}