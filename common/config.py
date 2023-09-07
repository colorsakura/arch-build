import tomllib
import os

class Config:
    def __init__(self) -> None:
        with open("../config.toml") as f:
            self._config = tomllib.loads(f)


if __name__ == '__main__':
    config = Config()
