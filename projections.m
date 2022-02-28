hold on;
view(0, 90);
quiver3(0, 0, 0, 1, 0, 0);
quiver3(0, 0, 0, 0, 1, 0);
quiver3(0, 0, 0, 0, 0, 1);
text(1, 0, 0, "e1", "fontsize", 28);
text(0, 1, 0, "e2", "fontsize", 28);
text(0, 0, 1, "e3", "fontsize", 28);

e1 = [1 0 0]';
e2 = [0 1 0]';
e3 = [0 0 1]';
u = [0.93391, 0.28563, 0.21499]';
quiver3(0, 0, 0, u(1), u(2), u(3));
text(u(1), u(2), u(3), "u = [0.93391, 0.28563, 0.21499]'", "fontsize", 28);

proj_e1 = e1' * u * e1;
quiver3(0, 0, 0, proj_e1(1), proj_e1(2), proj_e1(3));
text(proj_e1(1), proj_e1(2), proj_e1(3), "proj_{e1}(u)", "fontsize", 28);

u_e1 = u - e1' * u * e1;
quiver3(0, 0, 0, u_e1(1), u_e1(2), u_e1(3));
text(u_e1(1), u_e1(2), u_e1(3), "u - proj_{e1}(u)", "fontsize", 28);

proj_e2 = e2' * u_e1 * e2';
quiver3(0, 0, 0, proj_e2(1), proj_e2(2), proj_e2(3));
text(proj_e2(1), proj_e2(2), proj_e2(3), "proj_{e2}(u - proj_{e1}(u))", "fontsize", 28);

u_e2 = u_e1 - e2' * u_e1 * e2;
quiver3(0, 0, 0, u_e2(1), u_e2(2), u_e2(3));
text(u_e2(1), u_e2(2), u_e2(3), "u - proj_{e1}(u) - proj_{e2}(u)", "fontsize", 28);

% pause();