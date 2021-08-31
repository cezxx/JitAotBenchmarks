package benchmark;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/benchmark")
public class ExampleResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello Benchmarks!";
    }


    @GET
    @Path("/load")
    @Produces(MediaType.TEXT_PLAIN)
    public String loadTest() {
        int n = 30000;

        Nbody.NBodySystem bodies = new Nbody.NBodySystem();
        for (int i = 0; i < n; ++i) {
            bodies.advance(0.01);
        }
        return "OK";
    }
}