
public final class Schachtel implements Comparable<Schachtel> {
	private final String id;
	private final long anzahl;
	private final int potenz;
	private final long einzelgewicht;
	private final long gesamtgewicht;

	private static final long zehnHoch18 = 1000000000000000000L;

	public Schachtel(int potenz, long anzahl, String id) {
		assert (0 <= anzahl && anzahl <= zehnHoch18);
		assert (0 <= potenz && potenz <= 18);
		
		this.anzahl = anzahl;
		this.potenz = potenz;
		einzelgewicht = (long) Math.pow(10, potenz);
		gesamtgewicht = einzelgewicht * anzahl;

		// Die Assertions aproximieren diesen Constraint:
		// 0 <= anzahl * 10^potenz <= 10^18
		assert (einzelgewicht % 10 == 0);
		assert (0 <= gesamtgewicht && gesamtgewicht <= zehnHoch18);
		assert (gesamtgewicht % einzelgewicht == 0);
		assert (gesamtgewicht / einzelgewicht == anzahl);
		
		this.id = id;
	}

	
	public String getId() {
		return id;
	}
	
	public long getAnzahl() {
		return anzahl;
	}

	public int getPotenz() {
		return potenz;
	}

	public long getEinzelgewicht() {
		return einzelgewicht;
	}

	public long getGesamtgewicht() {
		return gesamtgewicht;
	}


	@Override
	public int compareTo(Schachtel x) {
		if (this.getGesamtgewicht() < x.getGesamtgewicht())
			return 1;
		else if (this.getGesamtgewicht() == x.getGesamtgewicht())
			return 0;
		else
			return -1;
	}
}
