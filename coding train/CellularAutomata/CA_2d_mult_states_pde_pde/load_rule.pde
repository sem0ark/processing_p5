byte[] loadRules(boolean rand) {
  byte[] rule;
  states = 3;
  if (rand){
    rule = new byte[floor(pow(states, 5))];
    for (int i=1; i<rule.length; i++) {
      rule[i] = (byte) floor(random(states));
    }
  } else {
    String[] strRule = loadStrings("saved_rules.txt");
    numberToChoose = int(strRule[0]);
    String[] t = split(strRule[numberToChoose-1], '#');
    
    strRule = split(t[t.length-1], '/');
    states = int(strRule[2]);
    sw = int(strRule[3]);
    sh = int(strRule[4]);
    String[] raw_rule = split(strRule[5], ' ');
    String[] raw_coefs = split(strRule[6], ' ');
    
    neib_coefs = new int[raw_coefs.length];
    for (int i=0; i<raw_coefs.length; i++) {
      neib_coefs[i] = (byte) int(raw_coefs[i]);
    }
    
    rule = new byte[raw_rule.length];
    for (int i=0; i<raw_rule.length; i++) {
    rule[i] = (byte) int(raw_rule[i]);
    }
  }
  
  println(str(neib_coefs));
  println(str(rule));
  
  return rule;
}

void preload_rule_file() {
  String[] t = loadStrings("data/saved_rules.txt");
  for (String s: t) {
    rule_file.add(s);
  }
}
