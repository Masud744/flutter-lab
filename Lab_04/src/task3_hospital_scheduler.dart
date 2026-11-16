class Patient {
  String name;
  String phone;

  Patient(this.name, this.phone);
}

class Doctor {
  String name;
  String specialization;
  List<String> availableSlots;
  Map<String, Patient> bookings = {};

  Doctor(this.name, this.specialization, this.availableSlots);

  void bookAppointment(Patient patient, String slot) {
    if (!availableSlots.contains(slot)) {
      print('Booking failed: Slot "$slot" is not available for Dr. $name');
      return;
    }

    availableSlots.remove(slot);
    bookings[slot] = patient;
    print('Booked: ${patient.name} with Dr. $name at $slot');
  }

  void displaySummary() {
    print('\n--- Doctor Schedule: Dr. $name ($specialization) ---');
    print('Bookings:');
    if (bookings.isEmpty) {
      print('  No appointments booked');
    } else {
      bookings.forEach((slot, p) {
        print('  $slot -> ${p.name} (${p.phone})');
      });
    }

    print('Remaining Slots:');
    print('  ${availableSlots.join(', ')}\n');
  }
}

void main() {
  var doctor = Doctor('Kamrul Ahsan', 'Cardiology', [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
  ]);

  var p1 = Patient('Shahriar Alom Masud', '01711223344');
  var p2 = Patient('Arifur Rahman', '01822334455');
  var p3 = Patient('Mst. Nazma Begum', '01933445566');

  doctor.bookAppointment(p1, '10:00 AM');
  doctor.bookAppointment(p2, '10:30 AM');
  doctor.bookAppointment(p3, '10:00 AM'); // already booked

  doctor.displaySummary();
}
