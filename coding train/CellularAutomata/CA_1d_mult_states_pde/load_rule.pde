byte[] getInitArray_2(boolean rand) {
  int st;
  long n;
  byte[] rule;
  if (rand) {
    rule = new byte[floor(pow(states, neibs))];
    for (int i=0; i<rule.length; i++) {
      rule[i] = (byte) floor(random(states));
    }
    println(str(rule));
  } else {
    String[] strRule = loadStrings("saved_rules.txt");
    //println(strRule);
    numberToChoose = int(strRule[1]);
    String[] t = split(strRule[numberToChoose+1], '#');
    strRule = split(t[t.length-1], '/');
    //println(strRule);
    states = int(strRule[2]);
    neibs = int(strRule[3]);
    String[] r = split(strRule[4], ' ');
    rule = new byte[floor(pow(states, neibs))];
    for (int i=0; i<r.length; i++) {
      rule[i] = (byte) int(r[i]);
    }
    println(states, neibs);
    println(str(rule));
  }
  return rule;
}

byte[] getInitArray(boolean rand) {
  
  int st;
  long n;
  byte[] rule;
  if (rand) {
    rule = new byte[floor(pow(states, neibs))];
    for (int i=0; i<rule.length; i++) {
      rule[i] = (byte) floor(random(states));
    }
    println(str(rule));
  } else {
    String[] strRule = loadStrings("rule.txt");
    numberToChoose = int(strRule[0]);
    strRule = split(strRule[numberToChoose], "/");
    states = int(strRule[strRule.length-1]);
    neibs = int(strRule[strRule.length-2]);
    n = Long.parseUnsignedLong(strRule[0]);
    rule = new byte[floor(pow(states, neibs))];
    int c = 0;
    while (n > 0) {
      st = (int) n % states;
      rule[rule.length - c - 1] += st;
      n = n / states;
      c += 1;
    }
  }
  return rule;
}

void preload_rule_file() {
  String[] t = loadStrings("data/saved_rules.txt");
  for (String s: t) {
    rule_file.add(s);
  }
}
