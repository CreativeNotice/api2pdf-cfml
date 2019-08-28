
component extends=testbox.system.BaseSpec {
	
	function beforeAll(){
		variables.apiUrl  = 'https://v2018.api2pdf.com/';
		variables.apiKey  = 'e976901b-b07f-482b-a96d-59c1f9498428'
		variables.api2pdf = new api2pdf( apiKey, apiUrl );
	};

	function afterAll(){};

	function run( testResults, testBox ){

		describe( 'Api2PDF component setup', function(){

			it( 'Is a component', function(){
				expect( variables.api2pdf ).toBeTypeOf( 'component' );
			});

			it('Has a struct for settings', function(){
				expect( variables.api2pdf.getApiSettings() ).toBeTypeOf( 'struct' );
			});

			it('API key was set', function(){
				expect( variables.api2pdf.getApiSettings().key ).toBe( apiKey );
			});

			it('API base URL was set', function(){
				expect( variables.api2pdf.getApiSettings().base_url ).toBe( apiUrl );
			});
		});

		describe( 'Api2PDF wkHtmlToPDF conversion', function(){

			it('Method wkHtmlToPdfFromHtml returns json response', function(){
				expect( variables.api2pdf.wkHtmlToPdfFromHtml( '<html><body><p>Hello Mars!</p></body></html>', 'test.pdf' ) ).toBeStruct();
			});

			it('Method wkhtmlToPdfFromUrl returns json response', function(){
				expect( variables.api2pdf.wkhtmlToPdfFromUrl( 'http://google.com', 'test.pdf' ) ).toBeStruct();
			});
		});

		describe( 'Api2PDF headless Chrome conversion', function(){

			it('Method headlessChromeFromHtml returns json response', function(){
				expect( variables.api2pdf.headlessChromeFromHtml( '<html><body><p>Hello Mars!</p></body></html>', 'test.pdf' ) ).toBeStruct();
			});

			it('Method headlessChromeFromUrl returns json response', function(){
				expect( variables.api2pdf.headlessChromeFromUrl( 'http://google.com', 'test.pdf' ) ).toBeStruct();
			});
		});

		describe( 'Api2PDF LibraOffice', function(){

			it('Method libreOfficeConvert returns json response', function(){
				expect( variables.api2pdf.libreOfficeConvert( 'URL to PDF here', 'test.pdf' ) ).toBeStruct();
			});
		});

		describe( 'Api2PDF Utilities', function(){

			it('Method merge returns json response', function(){
				expect( variables.api2pdf.merge( ['first.pdf', 'second.pdf'], 'test.pdf' ) ).toBeStruct();
			});

			it('Method Delete returns json response', function(){
				expect( variables.api2pdf.delete( '0cdfdb27-dcc0-413e-a713-b9371b2e2678' ) ).toBeStruct();
			});

			it('Get zing barcode', function(){
				expect( variables.api2pdf.zxing( 'Hello Jupiter', 'BAR_128' ) ).toBeBinary();
			});
		});

	};
};