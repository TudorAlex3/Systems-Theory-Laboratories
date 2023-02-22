plot(out.simout)
title("Starea sistemului in regim liber");
xlabel("t");
ylabel("xl(t)");
grid ON;

figure;
plot(out.simout1)
title("Raspunsul sistemului reprezentat pe stare");
xlabel("u(t)");
ylabel("t");
grid ON;

figure;
plot(out.simout2)
title("Raspunsul sistemului reprezentat pe intrare-iesire");
xlabel("u(t)");
ylabel("T(s)");
grid ON;

figure;
plot(out.simout3)
title("Raspunsul sistemului in regim fortat");
xlabel("t");
ylabel("yf(t)");
grid ON;
