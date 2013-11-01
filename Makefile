all:
	perl -pi -e 's/^(.)/C: \1/' < examples/check-command.xml > examples/check-command.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/check-response.xml > examples/check-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/transfer-query-response.xml > examples/transfer-query-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/create-response.xml > examples/create-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/renew-response.xml > examples/renew-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/transfer-response.xml > examples/transfer-response.txt
	perl -pi -e 's/^(.)/S: \1/' < examples/update-response.xml > examples/update-response.txt

	xmllint --xinclude draft-brown-epp-fees.xml.in > draft-brown-epp-fees.xml

	xml2rfc draft-brown-epp-fees.xml

	rm -fv draft-brown-epp-fees.xml examples/*txt
