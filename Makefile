all:	
	make tests
	make build
	make clean

tests:
	xmllint --noout --schema test-xsds/epp.xsd examples/check-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/check-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/info-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/info-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/info-response-notregistered.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/transfer-query-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/create-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/create-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/renew-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/renew-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/transfer-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/transfer-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/update-command.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/update-response.xml
	xmllint --noout --schema test-xsds/epp.xsd examples/delete-response.xml

build:
	perl -pi -e 's/^(.)/C: \1/' < examples/check-command.xml > examples/check-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/check-response.xml > examples/check-response.txt
	perl -pi -e 's/^(.)/C: \1/' < examples/info-command.xml > examples/info-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/info-response.xml > examples/info-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/info-response-notregistered.xml > examples/info-response-notregistered.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/transfer-query-response.xml > examples/transfer-query-response.txt
	perl -pi -e 's/^(.)/C: \1/' < examples/create-command.xml > examples/create-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/create-response.xml > examples/create-response.txt
	perl -pi -e 's/^(.)/C: \1/' < examples/renew-command.xml > examples/renew-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/renew-response.xml > examples/renew-response.txt
	perl -pi -e 's/^(.)/C: \1/' < examples/transfer-command.xml > examples/transfer-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/transfer-response.xml > examples/transfer-response.txt
	perl -pi -e 's/^(.)/C: \1/' < examples/update-command.xml > examples/update-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/update-response.xml > examples/update-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/delete-response.xml > examples/delete-response.txt

	xmllint --xinclude draft-brown-epp-fees.xml.in > draft-brown-epp-fees.xml

	xml2rfc draft-brown-epp-fees.xml draft-brown-epp-fees.txt
	xml2rfc draft-brown-epp-fees.xml draft-brown-epp-fees.html

clean:
	rm -vf draft-brown-epp-fees.xml examples/*txt
