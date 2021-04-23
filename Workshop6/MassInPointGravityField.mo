within CourseExamples.Workshop6;
model MassInPointGravityField
  extends MassInGravityField(mass(r_0(start={0,1,0}), v_0(start={1,0,0})),
      world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity,
        mue=1));
end MassInPointGravityField;
