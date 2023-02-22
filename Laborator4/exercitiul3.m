figure;
plot(out.simout1,  'c -')
title("Raspunsul fortat al sistemului liniar neted reprezentat pe stare.");
xlabel("u(t)");
ylabel("t");
grid ON;

figure;
plot(out.simout2, 'r -.')
title("Raspunsul sistemului liniar discret reprezentat pe stare.");
xlabel("u(t)");
ylabel("T(s)");
grid ON;

figure;
plot(out.simout3, 'g :')
title("Raspunsul fortat al sistemului discretizat reprezentat intrare iesire.");
xlabel("t");
ylabel("yf(t)");
grid ON;