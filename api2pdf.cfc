/**
 * api2pdf component for CFML
 * This client library implementation uses the POST method where possible.
 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0
 * @author Ryan Mueller, https://twitter.com/CreativeNotice
 * @license MIT
 */
component accessors=true {

	property name='apiKey'      type='string';
	property name='apiBaseURL'  type='string';
	property name='apiSettings' type='struct' setter=false;
	
	/**
	 * The Constructor
	 * Note that CFML engines auto-run the `init()` method of CFCs
	 * @apiKey The api2pdf service api key to use
	 * @apiBaseURL The api2pdf service base URL
	 */
	function init( required string apiKey, string apiBaseURL='https://v2018.api2pdf.com/' ){

		this.setApiKey( arguments.apiKey );
		this.setApiBaseURL( arguments.apiBaseURL );
		this.setApiSettings();

		return this;
	};

	/**
	 * Request a wkHtmlToPDF PDF of the HTML content you provide
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/wkhtmltopdf/wkhtmltopdfFromHtmlPost
	 * @content The HTML content you'd like to PDF
	 * @fileName The filename to use for the resulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 * @options https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/
	 */
	function wkHtmlToPdfFromHtml( required string content, string fileName='', boolean inline=false, struct options={} ){
		// Build request body
		var body = {
			  html      = arguments.content
			, inlinePdf = arguments.inline
			, fileName  = arguments.fileName
		};

		// Buid & send http request
		var apiEndpoint = this.getApiSettings().endpoints.wkhtmltopdf.html;
		var response    = doAPIRequest( apiEndpoint, body, arguments.options );

		return response;
	};

	/**
	 * Request a wkHtmlToPDF PDF via wkhtmltopdf via a URL
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/wkhtmltopdf/wkhtmltopdfFromUrlPost
	 * @url The URL to load and convert to PDF
	 * @fileName The filename to use for the resulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 * @options https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/
	 */
	function wkhtmlToPdfFromUrl( required string url, string fileName='default.pdf', boolean inline=false, struct options={} ){
		// @TODO: Implement
		return {};
	};

	/**
	 * Request a Headless Chrome PDF of the HTML content you provide. 
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/Headless%20Chrome/chromeFromHtmlPost
	 * @content The HTML content you'd like to PDF
	 * @fileName The filename to use for the resulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 * @options https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/
	 */
	function headlessChromeFromHtml( required string content, string fileName='default.pdf', boolean inline=false, struct options={} ){
		// Build request body
		var body = {
			  html      = arguments.content
			, inlinePdf = arguments.inline
			, fileName  = arguments.fileName
		};

		// Buid & send http request
		var apiEndpoint = this.getApiSettings().endpoints.chrome.html;
		var response    = doAPIRequest( apiEndpoint, body, arguments.options );

		return response;
	};

	/**
	 * Request a Headless Chrome PDF via wkhtmltopdf via a URL
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/Headless%20Chrome/chromeFromUrlPost
	 * @url The URL to load and convert to PDF
	 * @fileName The filename to use for the resulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 * @options https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/
	 */
	function headlessChromeFromUrl( required string url, string fileName='default.pdf', boolean inline=false, struct options={} ){
		// @TODO: Implement
		return {};
	};

	/**
	 * Request a Headless Chrome PDF via wkhtmltopdf via a URL
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/LibreOffice/libreConvertPost
	 * @url The URL to load and convert to PDF
	 * @fileName The filename to use for the resulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 */
	function libreOfficeConvert( required string url, string fileName='default.pdf', boolean inline=false ){
		// @TODO: Implement
		return {};
	};

	/**
	 * Request one of more PDF documents to be merged into one file.
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/Merge%20%2F%20Combine%20Pdfs/mergePost
	 * @files An array of URLs for files to be merged
	 * @fileName The filename to use for the rsulting PDF
	 * @inline When true, URL returned will load in browser, when false URL returned will download
	 */
	function merge( required array files, string fileName='default.pdf', boolean inline=false ){
		// @TODO: Implement
		return {};
	};

	/**
	 * Request to delete a specific api2pdf generated PDF from the AWS storage location
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/Utility%20Commands/pdfDELETE
	 * @responseId The response id from a previously generated PDF
	 */
	function delete( required string responseId ){
		// @TODO: Implement
		return {};
	};

	/**
	 * Generate bar codes and QR codes with ZXING.
	 * You'll only want to use this if you need to download the resulting image.
	 * If you're needing to generate barcodes in your PDFs, just build out the GET URL in your html content.
	 * See: https://app.swaggerhub.com/apis-docs/api2pdf/api2pdf/1.0.0#/ZXING%20(Zebra%20Crossing)%20Bar%20Codes/zebraGET
	 * See: https://www.api2pdf.com/documentation/advanced-options-zxing-zebra-crossing-barcodes/
	 * @format The format of the resulting symbol
	 * @value What should the symbol encode
	 * @showLabel True to print value below symbol
	 * @height What height
	 * @width What width
	 */
	function zxing( required string format, required string value, boolean showLabel=false, numeric height=100, numeric width=200 ){
		// @TODO: Implement
		return toBinary( toBase64( arguments.value ) );
	};

	/**
	 * Init an http service object & send our request
	 * See: https://www.api2pdf.com/documentation/advanced-options-headless-chrome/
	 * See: https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/
	 * @apiUrl Should be the full api endpoint for the type of request we're making
	 * @body The JSON string that should be passed through the HTTP request body
	 * @options Chrome or wkHtmlToPdf options, will be appended to body JSON string
	 * @method  The HTTP method
	 * @charset Change to UTF-16 if you're using international characters
	 */
	function doAPIRequest( required string apiUrl, struct body, struct options, string method='POST', string charset='utf-8' ){

		// Setup http service opject
		httpService = new http( url=arguments.apiUrl, method=arguments.method, charset=arguments.charset );
		httpService.addParam( name='Authorization', type='header', value=this.getApiKey() );
		
		// Setup body if it exists
		if( structKeyExists( arguments, 'body' ) ){

			body['options'] = ( structKeyExists( arguments, 'options' ) ) ? arguments.options : {};
			httpService.addParam( name='Body', type='body', value=serializeJSON( arguments.body ) );
		}

		// Perform the http request
		var response = httpService.send().getPrefix();

		// Some basic error handling on the response
		if( response.Responseheader.status_code != 200 ){
			throw( 'Error requesting remote resource. HTTP response code: ' & response.errordetail, response );
		}

		if( ! isJSON( response.filecontent ) ){
			throw( 'API reponse is not of type json' );
		}

		// Let's return this in a cleaned up state
		var sanitaryResponse = {
			  'code'     = response.Responseheader.status_code
			, 'error'    = response.errordetail
			, 'content'  = deserializeJSON( response.filecontent ).pdf
			, 'original' = response
		};

		return sanitaryResponse;
	};

	/**
	 * Used during component instantiation to establish our API endpoints
	 * @config In case you want to pass in your own custom settings
	 */
	function setApiSettings( config ){

		if( structKeyExists( arguments, 'config' ) ){

			variables.ApiSettings = arguments.config;

		}else{

			variables.ApiSettings.base_url = this.getApiBaseURL();
			variables.ApiSettings.key = this.getApiKey();
			variables.ApiSettings.endpoints = {
				merge = variables.ApiSettings.base_url & '/merge'
				, delete = variables.ApiSettings.base_url & '/delete'
				, chrome = {
					html = variables.ApiSettings.base_url & '/chrome/html'
					, url = variables.ApiSettings.base_url & '/chrome/url'
				}
				, wkhtmltopdf = {
					html = variables.ApiSettings.base_url & '/wkhtmltopdf/html'
					, url = variables.ApiSettings.base_url & '/wkhtmltopdf/url'
					
				}
				, libre = {
					convert = variables.ApiSettings.base_url & '/libreoffice/convert'
				}
			};

		}
	};

}
