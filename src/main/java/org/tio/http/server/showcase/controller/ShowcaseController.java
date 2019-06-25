package org.tio.http.server.showcase.controller;

import java.io.File;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tio.http.common.HttpRequest;
import org.tio.http.common.HttpResponse;
import org.tio.http.common.UploadFile;
import org.tio.http.server.annotation.RequestPath;
import org.tio.http.server.showcase.model.User;
import org.tio.http.server.util.Resps;
import org.tio.utils.hutool.FileUtil;
import org.tio.utils.json.Json;
import org.tio.utils.resp.RespVo;

/**
 * ab -k -n1000000 -c10 http://127.0.0.1:8080/json
 * ab -k -n1000000 -c10 http://127.0.0.1:8080/plaintext
 * @author tanyaowu
 * 2017年6月29日 下午7:53:59
 */
@RequestPath(value = "/showcase")
public class ShowcaseController {
	private static Logger log = LoggerFactory.getLogger(ShowcaseController.class);

	/**
	 * @param args
	 * @author tanyaowu
	 */
	public static void main(String[] args) {

	}

	String html = "<div style='position:relation;border-radius:10px;text-align:center;padding:10px;font-size:40pt;font-weight:bold;background-color:##e4eaf4;color:#2d8cf0;border:0px solid #2d8cf0; width:600px;height:400px;margin:auto;box-shadow: 1px 1px 50px #000;position: fixed;top:0;left:0;right:0;bottom:0;'>"
			+ "<a style='text-decoration:none' href='https://gitee.com/tywo45/t-io' target='_blank'>" + "<div style='text-shadow: 8px 8px 8px #99e;'>hello tio httpserver</div>"
			+ "</a>" + "</div>";

	String txt = html;

	/**
	 *
	 * @author tanyaowu
	 */
	public ShowcaseController() {
	}

	@RequestPath(value = "/404")
	public HttpResponse page404(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, "自定义的404");
		return ret;
	}

	@RequestPath(value = "/500")
	public HttpResponse page500(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, "自定义的500");
		return ret;
	}

	@RequestPath(value = "/abtest")
	public HttpResponse abtest(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, "OK");
		return ret;
	}

	/**
	 * 测试映射重复
	 */
	@RequestPath(value = "/abtest")
	public HttpResponse abtest1(HttpRequest request) throws Exception {
		log.info("");
		HttpResponse ret = Resps.html(request, "OK---------1");
		return ret;
	}
	
	
	@RequestPath(value = "/date")
	public HttpResponse date(Date[] date, java.sql.Date[] sqlDate, java.sql.Timestamp[] timestamp, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.json(request, Json.toFormatedJson(date) + Json.toFormatedJson(sqlDate) + Json.toFormatedJson(timestamp));
		return ret;
	}
	

	/**
	 *  string数组<br>
	    <input type="text" name="names" value="kobe">
		<input type="text" name="names" value="tan">
		
		<br><br>Integer数组<br>
		<input type="text" name="ids" value="11">
		<input type="text" name="ids" value="22">
		
		<br><br>int数组<br>
		<input type="text" name="primitiveIds" value="55">
		<input type="text" name="primitiveIds" value="66">
	 * @param names
	 * @param ids
	 * @param primitiveIds
	 * @param request
	 * @return
	 * @throws Exception
	 * @author tanyaowu
	 */
	@RequestPath(value = "/array")
	public HttpResponse array(String[] names, Integer[] ids, int[] primitiveIds, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.json(request, Json.toFormatedJson(names) + Json.toFormatedJson(ids) + Json.toFormatedJson(primitiveIds));
		
		Object[] xx = request.getParamArray("names");
		log.info("xx:{}", Json.toFormatedJson(xx));
		return ret;
	}

	@RequestPath(value = "/bean")
	public HttpResponse bean(User user, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.json(request, Json.toFormatedJson(user));
		return ret;
	}

	@RequestPath(value = "/filetest")
	public HttpResponse filetest(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.file(request, new File("d:/tio.exe"));
		return ret;
	}
	
	@RequestPath(value = "/var/{name}/{id}")
	public HttpResponse var(String name, String id, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.json(request, "name:" + name + "\r\n" + "id:" + id);
		return ret;
	}

	@RequestPath(value = "/test.zip")
	public HttpResponse test_zip(HttpRequest request) throws Exception {
		String root = request.httpConfig.getPageRoot(request);
		HttpResponse ret = Resps.file(request, new File(root, "test/test.zip"));
		return ret;
	}

	@RequestPath(value = "/html")
	public HttpResponse html(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, html);
		return ret;
	}

	@RequestPath(value = "/json")
	public HttpResponse json(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.json(request, RespVo.ok());
		return ret;
	}

	@RequestPath(value = "/plain")
	public HttpResponse plain(String before, String end, HttpRequest request) throws Exception {
		String bodyString = request.getBodyString();
		HttpResponse ret = Resps.html(request, bodyString);
		return ret;
	}

	@RequestPath(value = "/get")
	public HttpResponse get(String before, String end, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, "before:" + before + "<br>end:" + end);
		return ret;
	}

	@RequestPath(value = "/post")
	public HttpResponse post(String before, String end, HttpRequest request) throws Exception {
		HttpResponse ret = Resps.html(request, "before:" + before + "<br>end:" + end);
		return ret;
	}

	@RequestPath(value = "/putsession")
	public HttpResponse putsession(String value, HttpRequest request) throws Exception {
		request.getHttpSession().setAttribute("test", value, request.httpConfig);
		HttpResponse ret = Resps.json(request, "设置成功:" + value);
		return ret;
	}

	@RequestPath(value = "/getsession")
	public HttpResponse getsession(HttpRequest request) throws Exception {
		String value = (String) request.getHttpSession().getAttribute("test");
		HttpResponse ret = Resps.json(request, "获取的值:" + value);
		return ret;
	}

	@RequestPath(value = "/txt")
	public HttpResponse txt(HttpRequest request) throws Exception {
		HttpResponse ret = Resps.txt(request, txt);
		return ret;
	}

	/**
	 * 上传文件测试
	 * @param uploadFile
	 * @param request
	 * @param config
	 * @param channelContext
	 * @return
	 * @throws Exception
	 * @author tanyaowu
	 */
	@RequestPath(value = "/upload")
	public HttpResponse upload(UploadFile uploadFile, String before, String end, HttpRequest request) throws Exception {
		HttpResponse ret;
		if (uploadFile != null) {
			File file = new File("d:/" + uploadFile.getName());
			FileUtil.writeBytes(uploadFile.getData(), file);//.writeByteArrayToFile(file, uploadFile.getData());

			System.out.println("【" + before + "】");
			System.out.println("【" + end + "】");

			ret = Resps.html(request, "文件【" + uploadFile.getName() + "】【" + uploadFile.getSize() + "字节】上传成功");
		} else {
			ret = Resps.html(request, "请选择文件再上传");
		}
		return ret;
	}
}
