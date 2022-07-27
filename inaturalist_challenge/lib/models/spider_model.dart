import 'dart:convert';

class Spider {
  final String speciesGuess;
  final String taxonName;
  final String id;
  final String observedDetails;

  const Spider(
      {required this.speciesGuess,
      required this.taxonName,
      required this.id,
      required this.observedDetails});

  factory Spider.fromJson(Map<String, dynamic> json) {
    return Spider(
      speciesGuess: json['results']['species_guess'],
      taxonName: json['results']['taxon']['name'],
      id: json['results']['id'],
      observedDetails: json['results']['observed_on_details'],
    );
  }
}
