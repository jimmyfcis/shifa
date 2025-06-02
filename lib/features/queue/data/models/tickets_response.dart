class TicketsRootResponse {
  final TicketsResponse? tickets;

  TicketsRootResponse({this.tickets});

  factory TicketsRootResponse.fromJson(Map<String, dynamic> json) {
    return TicketsRootResponse(
      tickets: json['tickets'] != null
          ? TicketsResponse.fromJson(json['tickets'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tickets': tickets?.toJson(),
    };
  }
}

class TicketsResponse {
  final String? message;
  final List<Ticket>? tickets;

  TicketsResponse({
    this.message,
    this.tickets,
  });

  factory TicketsResponse.fromJson(Map<String, dynamic> json) {
    return TicketsResponse(
      message: json['message'] as String?,
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((item) => Ticket.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'tickets': tickets?.map((item) => item.toJson()).toList(),
    };
  }
}

class Ticket {
  final int? physicianID;
  final String? doctorName;
  final int? clinicID;
  final String? clinicName;
  final String? ticket;
  final String? status;
  final String? currentTicket;
  final String? clinicNo;
  final String? dayNameEn;
  final String? dayNameAr;
  final String? timeStart;
  final String? timeEnd;

  Ticket({
    this.physicianID,
    this.doctorName,
    this.clinicID,
    this.clinicName,
    this.ticket,
    this.status,
    this.currentTicket,
    this.clinicNo,
    this.dayNameEn,
    this.dayNameAr,
    this.timeStart,
    this.timeEnd,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      physicianID: json['physicianID'] as int?,
      doctorName: json['doctorName'] as String?,
      clinicID: json['clinicID'] as int?,
      clinicName: json['clinicName'] as String?,
      ticket: json['ticket'] as String?,
      status: json['status'] as String?,
      currentTicket: json['currentTicket'] as String?,
      clinicNo: json['clinicNo'] as String?,
      dayNameEn: json['dayNameEn'] as String?,
      dayNameAr: json['dayNameAr'] as String?,
      timeStart: json['timeStart'] as String?,
      timeEnd: json['timeEnd'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'physicianID': physicianID,
      'doctorName': doctorName,
      'clinicID': clinicID,
      'clinicName': clinicName,
      'ticket': ticket,
      'status': status,
      'currentTicket': currentTicket,
      'clinicNo': clinicNo,
      'dayNameEn': dayNameEn,
      'dayNameAr': dayNameAr,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
    };
  }
}
