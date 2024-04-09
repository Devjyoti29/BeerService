package guru.springframework.spring6restmvc.config;

import jakarta.servlet.*;
import org.slf4j.MDC;
import java.io.IOException;
import java.util.UUID;

public class MDCFilter implements Filter {


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            // Generate a unique identifier for the current request
            String uniqueId = UUID.randomUUID().toString();

            // Put the uniqueId into SLF4J's MDC under a key (e.g., requestId)
            MDC.put("requestId", uniqueId);

            // Proceed with the filter chain
            chain.doFilter(request, response);
        } finally {
            MDC.clear();
        }
    }
}
