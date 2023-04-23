FROM mongo:6
WORKDIR /data

ENTRYPOINT ["sh", "-c", "mongod --replSet rs0 --bind_ip 0.0.0.0 --port 27017 --fork --logpath ~/logs && sleep 1 && mongosh --eval 'try {rs.initiate({ _id: `rs0`, members: [{ _id: 0, host: `localhost:27017` }] });} catch {}' && sleep 1 && tail -f /dev/null"]

EXPOSE 27017
