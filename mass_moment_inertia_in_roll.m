function [ m2 ] = mass_moment_inertia_in_roll( params )

%%%Calculate mass moment of inertia in roll

%%% For starters the monopile is assumed to be cylindrical with a point mass
%%% attached to the top (the nacelle and rotor) and the bottom (ballast)
%%% The cylindrical tower rotates around the around its center of
%%% mass parallel to the x-axis

%%% ||
%%% ||
%%% ||======|-|   N (Nacelle)
%%% ||      | |    
%%% ||      | |
%%%         | |
%%%         | |
%%%         | |
%%%         |-|   I (Interface)
%%%         | |
%%%         |-|   M (Meta-centre point)
%%%         | |
%%% ~~~~~~~~| |~~ W (Water level) ~~~~~
%%%         |-|   G (Grav. centre)
%%%        /| |\  C (Mooring Cable suspension)
%%%       / |-| \ B (Buoyancy centre)
%%%      /  | |  \
%%%     /   |-|   \ E(Mono Pile bottom, ballast)

leg = params.leg;
lt = params.lt;
mn = params.mn;
mt = params.mt;
mb = params.mb;
D  = params.D;

%%% The moments of inertia in reference to the center of gravity consist of
%%% the respective inertia moment of nacelle,monopile,ballast + steiner part (which grows
%%% according to the distance between center of gravity(c.o.g) of each part to the
%%% global center of gravity)

%%% Nacelle
%%% distances between c.o.g of nacelle and global c.o.g
dn = lt - leg;
%%% inertia moment
In = mn*(1/4*leg^2+dn^2);

%%% Ballast
%%% distances between c.o.g of ballast and global c.o.g
db = leg;
%%% inertia moment
Ib = mb*(1/4*leg^2+db^2);

%%% Monopile
%%% distances between c.o.g of monopile and global c.o.g
dm = lt/2 - leg;
Im = 1/12*mt*(lt^2+1/4*D^2)+mt*dm^2;

%%%Moment of inertia is the sum of all individual moments of inertia with
%%%respect to the center of gravity

m2 = In + Ib + Im;

end

