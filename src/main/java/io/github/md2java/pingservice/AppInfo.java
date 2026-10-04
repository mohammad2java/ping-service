package io.github.md2java.pingservice;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.time.Duration;
import java.time.Instant;
import java.util.Collections;
import java.util.Objects;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.info.Info;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class AppInfo implements InfoContributor {

    private static final String UNKNOWN = "unknown";

    private final Instant startedAt = Instant.now();

    private String nodeIp = null;

    @Value("${app.version:" + UNKNOWN + "}")
    private String version;

        @Value("${app.commit:" + UNKNOWN + "}")
        private String commit;

    @Override
    public void contribute(Info.Builder builder) {
        Duration uptime = Duration.between(startedAt, Instant.now());
        builder.withDetail("app", "Ping Service");
        builder.withDetail("nodeIp", resolveNodeIp());
        builder.withDetail("uptime", format(uptime));
        builder.withDetail("uptimeSeconds", uptime.getSeconds());
        builder.withDetail("version", version);
        builder.withDetail("commit", commit);
    }

    /**
     * Best-effort lookup of the address this node is reachable on: the first
     * non-loopback site-local IPv4 interface, falling back to a hostname lookup
     * of the local host.
     */
    private String resolveNodeIp() {
        if (Objects.nonNull(nodeIp)) {
            return nodeIp;
        }
        try {
            for (NetworkInterface networkInterface : Collections.list(NetworkInterface.getNetworkInterfaces())) {
                if (networkInterface.isLoopback() || !networkInterface.isUp() || networkInterface.isVirtual()) {
                    continue;
                }
                for (InetAddress address : Collections.list(networkInterface.getInetAddresses())) {
                    if (address instanceof Inet4Address && address.isSiteLocalAddress() && !address.isLoopbackAddress()) {
                        nodeIp = address.getHostAddress();
                        log.info("Resolved node IP to: {}", nodeIp);
                        return nodeIp;
                    }
                }
            }
            String nodeIp = InetAddress.getLocalHost().getHostAddress();
            log.info("Resolved node IP to: {}", nodeIp);
            return nodeIp;
        } catch (SocketException | UnknownHostException e) {
            return UNKNOWN;
        }
    }

    private static String format(Duration duration) {
        long days = duration.toDays();
        long hours = duration.toHoursPart();
        long minutes = duration.toMinutesPart();
        return "%dd %dh %dm %ds".formatted(days, hours, minutes, duration.toSecondsPart());
    }
}
