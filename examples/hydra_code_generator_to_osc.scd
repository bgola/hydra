n = NetAddr("localhost", 57142);

(
r = fork {
	inf.do {
		var code = "osc(%,%,%)".format(exprand(10,105), 100.0.rand, 10.rand);
		10.rand.do {
			if (0.85.coin) {
				if (0.6.coin) {
					code = "%.modulate(osc(%,%,%).rotate(%))".format(code, exprand(10,500), 100.0.rand, 10.rand, 140.0.rand);
				} {
					code = "%.modulate(noise(%))".format(code,10.0.rand);
				}
			} {
				if (0.5.coin) {
					code = "%.blend(src(o%).scale(%), %)".format(code, 3.rand, 2.0.rand, 1.0.rand);
				} {
					code = "%.modulate(src(o%))".format(code, 3.rand);
				}
			};
		};
		n.sendMsg("/code", "%.out(o%); src(o%).out(o3); render(); %".format(code, 3.rand, 3.rand, 4.rand).postln);
		1.wait;
	}
}
)