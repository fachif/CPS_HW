within CourseExamples.Workshop15;
function powerFunction
  input Real value;
  input Integer p;
  output Real y;
  external "C" y = power(value,p);
  annotation (Include = "#include <MyExternalFunctions.c>");

end powerFunction;
