public class SummerVacationManager {
  public static final class MotherDoesntAgree extends Exception {}

  public void addParticipantToEvent(final Person participant, final String event)
      throws MotherDoesntAgree, UnknownMother,
             ParticipantsDatabase.UnknownEvent,
             ParticipantsDatabase.EventFull {
    if (participant == null || event == null) {
      throw new IllegalArgumentException();
    }
    ParticipantsDatabase db = null;
    try {
      db = ParticipantsDatabase.open(event);
      logIoEvent();
      final Person mother = participant.getMother();
      if (!mother.agrees()) {
        throw new MotherDoesntAgree();
      }
      db.add(participant);
    } catch(UnknownMother e) {
      db.add(participant);
    } finally {
      db.close();
      logIoEvent();
    }
  }

  public void logIoEvent() {
    // TODO
  }
}