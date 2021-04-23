within CourseExamples.Workshop6;
model SuspendedMassSteadyState
  extends SuspendedMass(fixed(r={0,0,0}), mass(r_0(start={0,-0.3924,0})));
end SuspendedMassSteadyState;
