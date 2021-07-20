void saveRule(String code) {
  String[] date = {
    nf(year(), 4),
    nf(month(), 2),
    nf(day(), 2),
    nf(hour(), 2),
    nf(minute(), 2),
    nf(second(), 2)
  };
  String[] l = {
    join(date, '_'),
    code,
    str(states),
    str(neibs),
    join(str(rules), ' ')
  };
  String s = join(l, '/');
  println(s);
  rule_file.add(s);
}

void saveFile() {
  for (String s: rule_file) {
    println(s);
  }
  
  String[] f = new String[rule_file.size()];
  for (int i=0; i<rule_file.size(); i++) {
    f[i] = rule_file.get(i);
  }
  saveStrings("data/saved_rules.txt", f);
}
