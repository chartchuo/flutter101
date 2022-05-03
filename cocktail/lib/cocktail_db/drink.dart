import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
class Drink {
  final String? idDrink;
  final String? strDrink;
  final dynamic strDrinkAlternate;
  final String? strTags;
  final dynamic strVideo;
  final String? strCategory;
  final String? strIba;
  final String? strAlcoholic;
  final String? strGlass;
  final String? strInstructions;
  final dynamic strInstructionsEs;
  final String? strInstructionsDe;
  final dynamic strInstructionsFr;
  final String? strInstructionsIt;
  final dynamic strInstructionsZhHans;
  final dynamic strInstructionsZhHant;
  final String? strDrinkThumb;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final dynamic strIngredient5;
  final dynamic strIngredient6;
  final dynamic strIngredient7;
  final dynamic strIngredient8;
  final dynamic strIngredient9;
  final dynamic strIngredient10;
  final dynamic strIngredient11;
  final dynamic strIngredient12;
  final dynamic strIngredient13;
  final dynamic strIngredient14;
  final dynamic strIngredient15;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final dynamic strMeasure4;
  final dynamic strMeasure5;
  final dynamic strMeasure6;
  final dynamic strMeasure7;
  final dynamic strMeasure8;
  final dynamic strMeasure9;
  final dynamic strMeasure10;
  final dynamic strMeasure11;
  final dynamic strMeasure12;
  final dynamic strMeasure13;
  final dynamic strMeasure14;
  final dynamic strMeasure15;
  final String? strImageSource;
  final String? strImageAttribution;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  const Drink({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIba,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsEs,
    this.strInstructionsDe,
    this.strInstructionsFr,
    this.strInstructionsIt,
    this.strInstructionsZhHans,
    this.strInstructionsZhHant,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  String toString() {
    return 'Drink(idDrink: $idDrink, strDrink: $strDrink, strDrinkAlternate: $strDrinkAlternate, strTags: $strTags, strVideo: $strVideo, strCategory: $strCategory, strIba: $strIba, strAlcoholic: $strAlcoholic, strGlass: $strGlass, strInstructions: $strInstructions, strInstructionsEs: $strInstructionsEs, strInstructionsDe: $strInstructionsDe, strInstructionsFr: $strInstructionsFr, strInstructionsIt: $strInstructionsIt, strInstructionsZhHans: $strInstructionsZhHans, strInstructionsZhHant: $strInstructionsZhHant, strDrinkThumb: $strDrinkThumb, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, strIngredient6: $strIngredient6, strIngredient7: $strIngredient7, strIngredient8: $strIngredient8, strIngredient9: $strIngredient9, strIngredient10: $strIngredient10, strIngredient11: $strIngredient11, strIngredient12: $strIngredient12, strIngredient13: $strIngredient13, strIngredient14: $strIngredient14, strIngredient15: $strIngredient15, strMeasure1: $strMeasure1, strMeasure2: $strMeasure2, strMeasure3: $strMeasure3, strMeasure4: $strMeasure4, strMeasure5: $strMeasure5, strMeasure6: $strMeasure6, strMeasure7: $strMeasure7, strMeasure8: $strMeasure8, strMeasure9: $strMeasure9, strMeasure10: $strMeasure10, strMeasure11: $strMeasure11, strMeasure12: $strMeasure12, strMeasure13: $strMeasure13, strMeasure14: $strMeasure14, strMeasure15: $strMeasure15, strImageSource: $strImageSource, strImageAttribution: $strImageAttribution, strCreativeCommonsConfirmed: $strCreativeCommonsConfirmed, dateModified: $dateModified)';
  }

  factory Drink.fromMap(Map<String, dynamic> data) => Drink(
        idDrink: data['idDrink'] as String?,
        strDrink: data['strDrink'] as String?,
        strDrinkAlternate: data['strDrinkAlternate'] as dynamic,
        strTags: data['strTags'] as String?,
        strVideo: data['strVideo'] as dynamic,
        strCategory: data['strCategory'] as String?,
        strIba: data['strIBA'] as String?,
        strAlcoholic: data['strAlcoholic'] as String?,
        strGlass: data['strGlass'] as String?,
        strInstructions: data['strInstructions'] as String?,
        strInstructionsEs: data['strInstructionsES'] as dynamic,
        strInstructionsDe: data['strInstructionsDE'] as String?,
        strInstructionsFr: data['strInstructionsFR'] as dynamic,
        strInstructionsIt: data['strInstructionsIT'] as String?,
        strInstructionsZhHans: data['strInstructionsZH-HANS'] as dynamic,
        strInstructionsZhHant: data['strInstructionsZH-HANT'] as dynamic,
        strDrinkThumb: data['strDrinkThumb'] as String?,
        strIngredient1: data['strIngredient1'] as String?,
        strIngredient2: data['strIngredient2'] as String?,
        strIngredient3: data['strIngredient3'] as String?,
        strIngredient4: data['strIngredient4'] as String?,
        strIngredient5: data['strIngredient5'] as dynamic,
        strIngredient6: data['strIngredient6'] as dynamic,
        strIngredient7: data['strIngredient7'] as dynamic,
        strIngredient8: data['strIngredient8'] as dynamic,
        strIngredient9: data['strIngredient9'] as dynamic,
        strIngredient10: data['strIngredient10'] as dynamic,
        strIngredient11: data['strIngredient11'] as dynamic,
        strIngredient12: data['strIngredient12'] as dynamic,
        strIngredient13: data['strIngredient13'] as dynamic,
        strIngredient14: data['strIngredient14'] as dynamic,
        strIngredient15: data['strIngredient15'] as dynamic,
        strMeasure1: data['strMeasure1'] as String?,
        strMeasure2: data['strMeasure2'] as String?,
        strMeasure3: data['strMeasure3'] as String?,
        strMeasure4: data['strMeasure4'] as dynamic,
        strMeasure5: data['strMeasure5'] as dynamic,
        strMeasure6: data['strMeasure6'] as dynamic,
        strMeasure7: data['strMeasure7'] as dynamic,
        strMeasure8: data['strMeasure8'] as dynamic,
        strMeasure9: data['strMeasure9'] as dynamic,
        strMeasure10: data['strMeasure10'] as dynamic,
        strMeasure11: data['strMeasure11'] as dynamic,
        strMeasure12: data['strMeasure12'] as dynamic,
        strMeasure13: data['strMeasure13'] as dynamic,
        strMeasure14: data['strMeasure14'] as dynamic,
        strMeasure15: data['strMeasure15'] as dynamic,
        strImageSource: data['strImageSource'] as String?,
        strImageAttribution: data['strImageAttribution'] as String?,
        strCreativeCommonsConfirmed:
            data['strCreativeCommonsConfirmed'] as String?,
        dateModified: data['dateModified'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'idDrink': idDrink,
        'strDrink': strDrink,
        'strDrinkAlternate': strDrinkAlternate,
        'strTags': strTags,
        'strVideo': strVideo,
        'strCategory': strCategory,
        'strIBA': strIba,
        'strAlcoholic': strAlcoholic,
        'strGlass': strGlass,
        'strInstructions': strInstructions,
        'strInstructionsES': strInstructionsEs,
        'strInstructionsDE': strInstructionsDe,
        'strInstructionsFR': strInstructionsFr,
        'strInstructionsIT': strInstructionsIt,
        'strInstructionsZH-HANS': strInstructionsZhHans,
        'strInstructionsZH-HANT': strInstructionsZhHant,
        'strDrinkThumb': strDrinkThumb,
        'strIngredient1': strIngredient1,
        'strIngredient2': strIngredient2,
        'strIngredient3': strIngredient3,
        'strIngredient4': strIngredient4,
        'strIngredient5': strIngredient5,
        'strIngredient6': strIngredient6,
        'strIngredient7': strIngredient7,
        'strIngredient8': strIngredient8,
        'strIngredient9': strIngredient9,
        'strIngredient10': strIngredient10,
        'strIngredient11': strIngredient11,
        'strIngredient12': strIngredient12,
        'strIngredient13': strIngredient13,
        'strIngredient14': strIngredient14,
        'strIngredient15': strIngredient15,
        'strMeasure1': strMeasure1,
        'strMeasure2': strMeasure2,
        'strMeasure3': strMeasure3,
        'strMeasure4': strMeasure4,
        'strMeasure5': strMeasure5,
        'strMeasure6': strMeasure6,
        'strMeasure7': strMeasure7,
        'strMeasure8': strMeasure8,
        'strMeasure9': strMeasure9,
        'strMeasure10': strMeasure10,
        'strMeasure11': strMeasure11,
        'strMeasure12': strMeasure12,
        'strMeasure13': strMeasure13,
        'strMeasure14': strMeasure14,
        'strMeasure15': strMeasure15,
        'strImageSource': strImageSource,
        'strImageAttribution': strImageAttribution,
        'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
        'dateModified': dateModified,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Drink].
  factory Drink.fromJson(String data) {
    return Drink.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Drink] to a JSON string.
  String toJson() => json.encode(toMap());

  Drink copyWith({
    String? idDrink,
    String? strDrink,
    dynamic strDrinkAlternate,
    String? strTags,
    dynamic strVideo,
    String? strCategory,
    String? strIba,
    String? strAlcoholic,
    String? strGlass,
    String? strInstructions,
    dynamic strInstructionsEs,
    String? strInstructionsDe,
    dynamic strInstructionsFr,
    String? strInstructionsIt,
    dynamic strInstructionsZhHans,
    dynamic strInstructionsZhHant,
    String? strDrinkThumb,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    dynamic strIngredient5,
    dynamic strIngredient6,
    dynamic strIngredient7,
    dynamic strIngredient8,
    dynamic strIngredient9,
    dynamic strIngredient10,
    dynamic strIngredient11,
    dynamic strIngredient12,
    dynamic strIngredient13,
    dynamic strIngredient14,
    dynamic strIngredient15,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    dynamic strMeasure4,
    dynamic strMeasure5,
    dynamic strMeasure6,
    dynamic strMeasure7,
    dynamic strMeasure8,
    dynamic strMeasure9,
    dynamic strMeasure10,
    dynamic strMeasure11,
    dynamic strMeasure12,
    dynamic strMeasure13,
    dynamic strMeasure14,
    dynamic strMeasure15,
    String? strImageSource,
    String? strImageAttribution,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
  }) {
    return Drink(
      idDrink: idDrink ?? this.idDrink,
      strDrink: strDrink ?? this.strDrink,
      strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
      strTags: strTags ?? this.strTags,
      strVideo: strVideo ?? this.strVideo,
      strCategory: strCategory ?? this.strCategory,
      strIba: strIba ?? this.strIba,
      strAlcoholic: strAlcoholic ?? this.strAlcoholic,
      strGlass: strGlass ?? this.strGlass,
      strInstructions: strInstructions ?? this.strInstructions,
      strInstructionsEs: strInstructionsEs ?? this.strInstructionsEs,
      strInstructionsDe: strInstructionsDe ?? this.strInstructionsDe,
      strInstructionsFr: strInstructionsFr ?? this.strInstructionsFr,
      strInstructionsIt: strInstructionsIt ?? this.strInstructionsIt,
      strInstructionsZhHans:
          strInstructionsZhHans ?? this.strInstructionsZhHans,
      strInstructionsZhHant:
          strInstructionsZhHant ?? this.strInstructionsZhHant,
      strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
      strIngredient1: strIngredient1 ?? this.strIngredient1,
      strIngredient2: strIngredient2 ?? this.strIngredient2,
      strIngredient3: strIngredient3 ?? this.strIngredient3,
      strIngredient4: strIngredient4 ?? this.strIngredient4,
      strIngredient5: strIngredient5 ?? this.strIngredient5,
      strIngredient6: strIngredient6 ?? this.strIngredient6,
      strIngredient7: strIngredient7 ?? this.strIngredient7,
      strIngredient8: strIngredient8 ?? this.strIngredient8,
      strIngredient9: strIngredient9 ?? this.strIngredient9,
      strIngredient10: strIngredient10 ?? this.strIngredient10,
      strIngredient11: strIngredient11 ?? this.strIngredient11,
      strIngredient12: strIngredient12 ?? this.strIngredient12,
      strIngredient13: strIngredient13 ?? this.strIngredient13,
      strIngredient14: strIngredient14 ?? this.strIngredient14,
      strIngredient15: strIngredient15 ?? this.strIngredient15,
      strMeasure1: strMeasure1 ?? this.strMeasure1,
      strMeasure2: strMeasure2 ?? this.strMeasure2,
      strMeasure3: strMeasure3 ?? this.strMeasure3,
      strMeasure4: strMeasure4 ?? this.strMeasure4,
      strMeasure5: strMeasure5 ?? this.strMeasure5,
      strMeasure6: strMeasure6 ?? this.strMeasure6,
      strMeasure7: strMeasure7 ?? this.strMeasure7,
      strMeasure8: strMeasure8 ?? this.strMeasure8,
      strMeasure9: strMeasure9 ?? this.strMeasure9,
      strMeasure10: strMeasure10 ?? this.strMeasure10,
      strMeasure11: strMeasure11 ?? this.strMeasure11,
      strMeasure12: strMeasure12 ?? this.strMeasure12,
      strMeasure13: strMeasure13 ?? this.strMeasure13,
      strMeasure14: strMeasure14 ?? this.strMeasure14,
      strMeasure15: strMeasure15 ?? this.strMeasure15,
      strImageSource: strImageSource ?? this.strImageSource,
      strImageAttribution: strImageAttribution ?? this.strImageAttribution,
      strCreativeCommonsConfirmed:
          strCreativeCommonsConfirmed ?? this.strCreativeCommonsConfirmed,
      dateModified: dateModified ?? this.dateModified,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Drink) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      idDrink.hashCode ^
      strDrink.hashCode ^
      strDrinkAlternate.hashCode ^
      strTags.hashCode ^
      strVideo.hashCode ^
      strCategory.hashCode ^
      strIba.hashCode ^
      strAlcoholic.hashCode ^
      strGlass.hashCode ^
      strInstructions.hashCode ^
      strInstructionsEs.hashCode ^
      strInstructionsDe.hashCode ^
      strInstructionsFr.hashCode ^
      strInstructionsIt.hashCode ^
      strInstructionsZhHans.hashCode ^
      strInstructionsZhHant.hashCode ^
      strDrinkThumb.hashCode ^
      strIngredient1.hashCode ^
      strIngredient2.hashCode ^
      strIngredient3.hashCode ^
      strIngredient4.hashCode ^
      strIngredient5.hashCode ^
      strIngredient6.hashCode ^
      strIngredient7.hashCode ^
      strIngredient8.hashCode ^
      strIngredient9.hashCode ^
      strIngredient10.hashCode ^
      strIngredient11.hashCode ^
      strIngredient12.hashCode ^
      strIngredient13.hashCode ^
      strIngredient14.hashCode ^
      strIngredient15.hashCode ^
      strMeasure1.hashCode ^
      strMeasure2.hashCode ^
      strMeasure3.hashCode ^
      strMeasure4.hashCode ^
      strMeasure5.hashCode ^
      strMeasure6.hashCode ^
      strMeasure7.hashCode ^
      strMeasure8.hashCode ^
      strMeasure9.hashCode ^
      strMeasure10.hashCode ^
      strMeasure11.hashCode ^
      strMeasure12.hashCode ^
      strMeasure13.hashCode ^
      strMeasure14.hashCode ^
      strMeasure15.hashCode ^
      strImageSource.hashCode ^
      strImageAttribution.hashCode ^
      strCreativeCommonsConfirmed.hashCode ^
      dateModified.hashCode;
}
