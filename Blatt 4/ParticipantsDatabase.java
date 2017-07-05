public abstract class ParticipantsDatabase {
  public static final class EventFull extends Exception {}
  public static final class UnknownEvent extends Exception {}
  public static ParticipantsDatabase open(final String eventName) throws UnknownEvent {
    // TODO: implement!
    return new ParticipantsDatabase() {
      @Override
      public void add(final Person participant) {}

      @Override
      public void close() {}
    };
  }

  public abstract void add(final Person participant) throws EventFull;
  public abstract void close();
}