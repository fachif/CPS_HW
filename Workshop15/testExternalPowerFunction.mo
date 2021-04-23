within CourseExamples.Workshop15;
model testExternalPowerFunction
  Integer [nbr] p = 0:8;
  Real [nbr] y;
protected
  parameter Integer nbr = 9;
equation
  for i in 1:nbr loop
    y[i] = powerFunction(2,p[i]);
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end testExternalPowerFunction;
