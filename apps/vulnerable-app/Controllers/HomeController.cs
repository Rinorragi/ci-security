using System.Diagnostics;
using System.Net;
using System.Runtime.Serialization.Formatters.Binary;
using Microsoft.AspNetCore.Mvc;
using vulnerable_app.Models;

namespace vulnerable_app.Controllers;

public class HomeController : Controller
{
  private readonly ILogger<HomeController> _logger;

  public HomeController(ILogger<HomeController> logger)
  {
    _logger = logger;
  }

  public IActionResult Index()
  {
    return View();
  }

  public IActionResult Privacy()
  {
    return View();
  }

  [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
  public IActionResult Error()
  {
    return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
  }

  // Seems like semgrep / GHAS won't find this
  public ContentResult XSSVulnerability([FromQuery] string content)
  {
    return new ContentResult
    {
      StatusCode = (int)HttpStatusCode.OK,
      ContentType = "text/html",
      Content = $"<html><body>{content}</body></html>"
    };
  }

  public IActionResult OpenRedirectVulnerability([FromQuery] string url)
  {
    return Redirect(url);
  }

  public IActionResult UnsafeDeserialization([FromQuery] byte[] bytes)
  {
    // Yes yes, I want to have an RCE for educational purposes
#pragma warning disable SYSLIB0011 // Type or member is obsolete
    BinaryFormatter formatter = new BinaryFormatter();
    formatter.Deserialize(new MemoryStream(bytes));
#pragma warning restore SYSLIB0011 // Type or member is obsolete
    return RedirectToAction("Index");
  }
}
