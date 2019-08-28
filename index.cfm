
<cfscript>
	/**
	 * Demo script
	 * This demo shows how to create a PDF with multiple dynamically generated pages. 
	 * You can either view in the browser or see the output from api2pdf. 
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0
	 */

	// Init out api2pdf client library
	// Replace API key with your own
	// See: https://portal.api2pdf.com/
	api2pdf = new api2pdf( 'e976901b-b07f-482b-a96d-59c1f9498428' );

	// Setup some options for the headless chrome
	// See: https://www.api2pdf.com/documentation/advanced-options-headless-chrome/
	options = {
		  'paperWidth'        = 4
		, 'paperHeight'       = 2
		, 'marginTop'         = 0
		, 'marginBottom'      = 0
		, 'marginRight'       = 0
		, 'marginLeft'        = 0
		, 'preferCSSPageSize' = true
	};

	// Demo values for serialized products
	values = [
		{ serial = '1327932', itemid = 'dla1272bsskt'	}
		, { serial = '0007114', itemid = 'kd14083bk'	}
	];

	// Let's create our PDF content, 
	// starting with the document header
	content = '
		<html>
			<head>
				<style>
					@page { size: 4.00in 2.00in; }
					body { margin:0; font-family: helvetica, san-serif; }
					article {}
					section { padding:0.4em 0 0 0; text-align:center; break-after: page; }
					h1 { margin:0; padding:0; font-size:3.5em; }
					h2 { margin:0 0 0.2em 0; padding:0; }
				</style>
			</head>
			<body>
				<article>
	';
	
	// Loop over our dynamic values and add pages to the document. 
	// Note that the `section` element has break-after:page in the CSS above.
	for( i = 1; i <= arrayLen( values ); i = i + 1 ){

		content &= '
		<section>
			<img src="https://v2018.api2pdf.com/zebra?format=CODE_128&value=#values[i].itemId#&showlabel=false&height=25&width=300&apikey=e976901b-b07f-482b-a96d-59c1f9498428">
			<h2>#values[i].itemId#</h2>
			<img src="https://v2018.api2pdf.com/zebra?format=CODE_128&value=#values[i].serial#&showlabel=false&height=50&width=300&apikey=e976901b-b07f-482b-a96d-59c1f9498428">
			<h1><strong>#values[i].serial#</strong></h1>
		</section>
		';
	}

	// Close out our document
	content &= '
			</article>
			</body>
		</html>
	';

	WriteOutput( '<h2>API Called... <br><small>expand for file URL</small></h2>')
	writeDump( var=api2pdf.headlessChromeFromHtml( content, '', true, options ), expand=false );

	WriteOutput( '<br><br>' );
	WriteOutput( '<h2>Document HTML</h2>' );
	WriteOutput( '<code>' & content & '</code>' );
</cfscript>
