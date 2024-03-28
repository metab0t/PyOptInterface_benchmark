// Copyright (c) 2024: Yue Yang
//
// Use of this source code is governed by an MIT-style license that can be found
// in the LICENSE.md file or at https://opensource.org/licenses/MIT.

#define _GLIBCXX_USE_CXX11_ABI 0
#include "coptcpp_pch.h"
#include <cmath>
#include <cstdlib>
#include <vector>
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
  const int G = atoi(argv[1]);
  const int F = atoi(argv[1]);
  cout << "G: " << G << ", F: " << F << endl;

  Envr env;
  Model model = env.CreateModel("fac");
  model.SetDblParam(COPT_DBLPARAM_TIMELIMIT, 0);
  // model.SetIntParam(COPT_INTPARAM_PRESOLVE, 0);
  model.SetIntParam(COPT_INTPARAM_LOGGING, 0);
  // Add variables
  Var d = model.AddVar(0.0, COPT_INFINITY, 1.0, COPT_CONTINUOUS);
  vector<vector<Var>> y;
  for (int f = 0; f < F; f++)
  {
    y.push_back(vector<Var>());
    for (int k = 0; k < 2; k++)
    {
      y[f].push_back(model.AddVar(0.0, 1.0, 0.0, COPT_CONTINUOUS));
    }
  }
  vector<vector<vector<Var>>> z;
  for (int i = 0; i <= G; i++)
  {
    z.push_back(vector<vector<Var>>());
    for (int j = 0; j <= G; j++)
    {
      z[i].push_back(vector<Var>());
      for (int f = 0; f < F; f++)
      {
        z[i][j].push_back(model.AddVar(0.0, 1.0, 0.0, COPT_BINARY));
      }
    }
  }
  vector<vector<vector<Var>>> s;
  for (int i = 0; i <= G; i++)
  {
    s.push_back(vector<vector<Var>>());
    for (int j = 0; j <= G; j++)
    {
      s[i].push_back(vector<Var>());
      for (int f = 0; f < F; f++)
      {
        s[i][j].push_back(model.AddVar(0.0, COPT_INFINITY, 0.0, COPT_CONTINUOUS));
      }
    }
  }
  vector<vector<vector<vector<Var>>>> r;
  for (int i = 0; i <= G; i++)
  {
    r.push_back(vector<vector<vector<Var>>>());
    for (int j = 0; j <= G; j++)
    {
      r[i].push_back(vector<vector<Var>>());
      for (int f = 0; f < F; f++)
      {
        r[i][j].push_back(vector<Var>());
        for (int k = 0; k < 2; k++)
        {
          r[i][j][f].push_back(
              model.AddVar(-COPT_INFINITY, COPT_INFINITY, 0.0, COPT_CONTINUOUS));
        }
      }
    }
  }
  // Add constraints
  for (int i = 0; i <= G; i++)
  {
    for (int j = 0; j <= G; j++)
    {
      Expr lhs;
      for (int f = 0; f < F; f++)
        lhs += z[i][j][f];
      model.AddConstr(lhs, COPT_EQUAL, 1.0);
    }
  }
  const double M = 2 * sqrt(2.0);
  for (int i = 0; i <= G; i++)
  {
    for (int j = 0; j <= G; j++)
    {
      for (int f = 0; f < F; f++)
      {
        model.AddConstr(s[i][j][f], COPT_EQUAL, d + M * (1 - z[i][j][f]));
        model.AddConstr(r[i][j][f][0], COPT_EQUAL, (1.0 * i) / G - y[f][0]);
        model.AddConstr(r[i][j][f][1], COPT_EQUAL, (1.0 * j) / G - y[f][1]);
        model.AddQConstr(r[i][j][f][0] * r[i][j][f][0] +
                             r[i][j][f][1] * r[i][j][f][1],
                         COPT_LESS_EQUAL, s[i][j][f] * s[i][j][f]);
      }
    }
  }
  model.Solve();
  return 0;
}
