package benchmark;

import io.quarkus.runtime.StartupEvent;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.event.Observes;

@ApplicationScoped
public class AppLifecycleBean {

    @ConfigProperty(name = "KILL_APP")
    Boolean killApp;

    void onStart(@Observes StartupEvent ev) {
        if (killApp) {
            new Thread(() -> System.exit(0)).start();
        }
    }
}
