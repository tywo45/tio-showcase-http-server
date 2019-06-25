package org.tio.http.server.showcase.init;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tio.http.common.HttpConfig;
import org.tio.http.common.handler.HttpRequestHandler;
import org.tio.http.server.HttpServerStarter;
import org.tio.http.server.handler.DefaultHttpRequestHandler;
import org.tio.http.server.showcase.HttpServerShowcaseStarter;
import org.tio.server.ServerGroupContext;
import org.tio.utils.jfinal.P;

/**
 * @author tanyaowu
 * 2017年7月19日 下午4:59:04
 */
public class HttpServerInit {
	@SuppressWarnings("unused")
	private static Logger log = LoggerFactory.getLogger(HttpServerInit.class);

	public static HttpConfig httpConfig;

	public static HttpRequestHandler requestHandler;

	public static HttpServerStarter httpServerStarter;

	public static ServerGroupContext serverGroupContext;

	public static void init() throws Exception {
		//		long start = SystemTimer.currTime;

		int port = P.getInt("http.port");//启动端口
		String pageRoot = P.get("http.page");//html/css/js等的根目录，支持classpath:，也支持绝对路径
		httpConfig = new HttpConfig(port, null, null, null);
		httpConfig.setPageRoot(pageRoot);
		httpConfig.setMaxLiveTimeOfStaticRes(P.getInt("http.maxLiveTimeOfStaticRes"));
		httpConfig.setPage404(P.get("http.404"));
		httpConfig.setPage500(P.get("http.500"));
		httpConfig.setUseSession(false);
		httpConfig.setCheckHost(false);

		requestHandler = new DefaultHttpRequestHandler(httpConfig, HttpServerShowcaseStarter.class);//第二个参数也可以是数组

		httpServerStarter = new HttpServerStarter(httpConfig, requestHandler);
		serverGroupContext = httpServerStarter.getServerGroupContext();
		httpServerStarter.start(); //启动http服务器

//		String protocol = SslUtils.isSsl(serverGroupContext) ? "https" : "http";

		//		long end = SystemTimer.currTime;
		//		long iv = end - start;
		//		if (log.isInfoEnabled()) {
		//			log.info("\r\nTio Http Server启动完毕,耗时:{}ms\r\n访问地址:{}://127.0.0.1:{}", iv, protocol, port);
		//		} else {
		//			System.out.println("\r\nTio Http Server启动完毕,耗时:" + iv + "ms,\r\n访问地址:" + protocol + "://127.0.0.1:" + port);
		//		}
	}

}
