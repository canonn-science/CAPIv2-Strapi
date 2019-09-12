// Script Function to get distance between two latitude and longitude

export const haversine = async (p1, p2, radius) => {
  const phi_a = (p1.latitude * Math.PI) / 180;
  const lambda_a = (p1.longitude * Math.PI) / 180;

  const phi_b = (p2.latitude * Math.PI) / 180;
  const lambda_b = (p2.longitude * Math.PI) / 180;

  const radius_planet = radius;

  let d_lambda;
  let S_ab;
  let D_ab;

  if (phi_a != phi_b || lambda_b != lambda_a) {
    d_lambda = lambda_b - lambda_a;
    S_ab = Math.acos(Math.sin(phi_a) * Math.sin(phi_b) + Math.cos(phi_a) * Math.cos(phi_b) * Math.cos(d_lambda));
    D_ab = S_ab * radius_planet;
  } else {
    D_ab = 0;
  }

  return D_ab;
};
