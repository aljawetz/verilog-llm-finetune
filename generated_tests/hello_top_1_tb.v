`timescale 1ns/1ps

module tb_hello_top;

    // Outputs
    wire led_out;

    // Instantiate the Unit Under Test (UUT)
    hello_top uut (
        .led_out(led_out)
    );

    // Test procedure
    initial begin
        // Wait for a short time to observe the output
        #10;

        // Check if led_out is high
        if (led_out !== 1'b1) begin
            $display("FAIL: led_out is not high");
            $finish;
        end

        // Wait for a longer time to ensure led_out remains high
        #100;

        // Check again if led_out is still high
        if (led_out !== 1'b1) begin
            $display("FAIL: led_out is not high after some time");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule