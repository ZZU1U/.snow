{ pkgs, ... }: {
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    dataLocation = "~/documents/.task";
    colorTheme = "dark-16";
    config={
      # Items in next 7 days Report
      report.fortnight.description="tasks due in next 7 days";
      report.fortnight.columns="due,id,description.count,urgency.integer";
      report.fortnight.dateformat="a";
      report.fortnight.sort="due+/,urgency-";
      #report.fortnight.filter=due.after:yesterday due.before=6days (+PENDING or +WAITING) -PARENT -DELETED
      report.fortnight.filter="(+OVERDUE or due.before=6days) (+PENDING or +WAITING) -PARENT -DELETED";
    };
  };
}
