**AU Base Medication** *[FMM Level [0](http://build.fhir.org/versions.html#maturity)]*

This profile defines a medication information structure including core localisation concepts for Australia. 
Wherever possible, the structure for medication information profiled here, has been aligned to the proposed R4 [Medication](http://hl7.org/fhir/2018May/medication.html). In support of alignment it is expected that value of Medication.package.content.item is the same as Medication.code; and the following elements have been profile to allow a maximum cardinality of 1:

* Medication.package
* Medication.package.content
* Medication.package.batch

The following elements available in STU3 [Medication](http://hl7.org/fhir/STU3/medication.html)  have been removed from the standard structure of R4 [Medication](http://hl7.org/fhir/2018May/medication.html), and for this reason it is recommended use of these elements is not encouraged:

* Medication.isBrand
* Medication.isOverCounter
* Medication.package.container

**Examples**

[Fluconazole Dose Based Medication](Medication-MedicationDoseBased.html)

[Paracetamol Generic Pack](Medication-GenericPack0.html)

[Nexium Hp7 Brand Pack](Medication-BrandedPack0.html)

[Nexium Hp7 Combination Package with Product Parts](Medication-CombinationPackage0.html)

[Clarithromycin 500mg Tablet Unbranded Product](Medication-UnbrandedProduct0.html)

[Esomeprazole 20mg Tablet Unbranded Product](Medication-UnbrandedProduct1.html)

[Amoxicillin 500mg Capsule Unbranded Product](Medication-UnbrandedProduct2.html)

[Norvasc 10 mg Tablet Brand Product with Batch Details](Medication-BrandProductwithBatchDetails0.html)


The following examples have been taken from the [National guidelines for on-screen display of clinical medicines information – January 2016](https://www.safetyandquality.gov.au/publications/national-guidelines-for-on-screen-display-of-clinical-medicines-information/) published by the Australian Commission on Safety and Quality in Health Care. Care has been taken with the clinical content in the structured data, and construction of narrative to be consistent with the guidelines:

[Single active ingredient product: pack-based](Medication-BrandedPackSingleActiveIngredient0.html)

[Two active ingredients product](Medication-TwoActiveIngredientsProduct0.html)

[Product with four or more active ingredients](Medication-FourOrMoreActiveIngredientsProduct0.html)
