within CourseExamples.Workshop10;
model NoSolution2
  Real x;
  Real y(start = 1.0);
equation
  y = 5;
  y = sin(x);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NoSolution2;
