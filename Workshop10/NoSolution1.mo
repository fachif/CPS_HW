within CourseExamples.Workshop10;
model NoSolution1
  Real x;
equation
  sin(x) = 2*time;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NoSolution1;
