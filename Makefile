Sources/DayPeriodFormatter/DayPeriodFormatter+RuleSets.swift: Resources/dayPeriods-processed.xml

Resources/dayPeriods.xml:
	@curl https://raw.githubusercontent.com/unicode-org/cldr/master/common/supplemental/dayPeriods.xml > $@

Resources/dayPeriods-processed.xml: Resources/dayPeriods.xml
	@sed -E -f Resources/uncomment.sed $< > $@

%.swift: %.swift.gyb
	@gyb --line-directive '' -o $@ $<

.PHONY:
clean:
	@rm Resources/dayPeriods-processed.xml
	@rm Sources/DayPeriodFormatter/DayPeriodFormatter+RuleSets.swift
