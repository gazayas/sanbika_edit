module SongsHelper

  def Notes
    sharp_notes = ["A", "A♯", "B", "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯"]
    flat_notes = ["A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭"]
    notes = [sharp_notes, flat_notes]
    return notes
  end
end
