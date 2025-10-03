
# Check if the ssh-agent is running for this session.
# If Agent is running and PID is valid. Do nothing and exit.
if test -n "$SSH_AGENT_PID"
    if kill -0 $SSH_AGENT_PID 2>/dev/null
        return
    end
end

eval (ssh-agent -c)

# Set the variables as **Universal (-U)**.
set -U SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -U SSH_AGENT_PID $SSH_AGENT_PID


# Add key if no keys are loaded.
# Check that the socket is set before attempting to add a key.
if set -q SSH_AUTH_SOCK
    ssh-add -l > /dev/null; or ssh-add ~/.ssh/id_ed25519
end
