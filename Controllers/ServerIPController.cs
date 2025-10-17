using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace WeatherApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ServerIPController : ControllerBase
    {

        [HttpGet]
        public IActionResult GetServerIp()
        {
            // Get the local IP address of the server
            IPAddress? serverIpAddress = HttpContext.Connection.LocalIpAddress;

            if (serverIpAddress != null)
            {
                return Ok("ServerIP: "+serverIpAddress.ToString());
            }
            else
            {
                return StatusCode(500, "Could not determine server IP address.");
            }
        }
    }
}
