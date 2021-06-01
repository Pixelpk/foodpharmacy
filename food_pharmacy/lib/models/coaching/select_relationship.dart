class SelectRelationship {
  final String relation;

  const SelectRelationship(this.relation);
}

const List<SelectRelationship> relationList = <SelectRelationship>[
  SelectRelationship("Single"),
  SelectRelationship("Married"),
];
